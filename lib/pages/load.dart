import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:wbc_detector/pages/result_page.dart';

import 'home_page.dart' as home;

Future<void> loadImage() async {
  home.res = "";

  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result == null) {
    print("error: in loadImage, result error!");
    return;
  }

  // file이 정상적으로 upload된 경우
  final filePath = result.files.single.path.toString();
  print("file uploaded!" + filePath);

  // make form
  FormData formData = FormData.fromMap({
    "file": await MultipartFile.fromFile(filePath),
    "string": "Hi Who are you!",
  });

  var options = BaseOptions(
    connectTimeout: 0,
    //receiveTimeout: 0,
  );

  Dio dio = Dio(options);

  final url = 'http://223.194.45.74:5000/predict';

  try {
    // api server에 파일 전송 시도
    Response response = await dio.post(url,
        data: formData,
        options: Options(method: 'POST', responseType: ResponseType.json));

    // print response
    print("response " + response.data.toString());

    // 전송에 성공한 경우
    if (response.statusCode == 200) {
      Map<String, dynamic> body = response.data; //response를 MAP으로
      print(response.data.toString() + " hallo!");
      home.res = body['name'];
      home.count = body['cnt'];
    } else {
      print("error: in loadImage method!");
    }
  } catch (e) {
    print("error occur in trying phrase");
    print(e);
  }
}

class LoadPage extends StatefulWidget {
  @override
  _LoadPageState createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  static String routeName = "/load";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("WBC Detector with DVS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 150),
            Text(
              '모델이 동작하고 있습니다.',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 50),
            FutureBuilder(
              future: loadImage(),
              initialData: "",
              builder: (context, AsyncSnapshot snapshot) {
                if (home.res == "") {
                  return Column(
                    children: [
                      SizedBox(height: 50),
                      Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  );
                } else {
                  return AlertDialog(
                    title: Text('모델 실행 완료.'), //제목
                    content: Text('검진 내용을 작성하시겠습니까?'), //내용
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ResultPage()),
                              (route) => false);
                        },
                        child: Text('네'),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
