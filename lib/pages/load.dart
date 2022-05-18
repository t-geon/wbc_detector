import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:wbc_detector/pages/result_page.dart';

import 'home_page.dart' as home;

Future<void> loadImage() async {
  home.res = "";
  // pick one file from smart phone
  // file type을 custom으로 지정해서 허용된 파일 유형을 지정할 수 있다.
  FilePickerResult? result = await FilePicker.platform.pickFiles();
  /*
  type: FileType.custom,
    allowedExtensions: ['aedat', 'jpg', 'aedat4']
  aedat 인식을 하지 못해서 일단 제외
  */
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
  //"file": myFile,

  var options = BaseOptions(
    connectTimeout: 0,
    receiveTimeout: 0,
  );

  Dio dio = Dio(options);

  //Dio dio = new Dio();
  //dio.options.connectTimeout = 0;
  //dio.options.receiveTimeout = 1000000;
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
      //final jsonBody = json.decode(response.data); // resonse를 data로 받는다.
      print(response.data.toString() + " hallo!");
      home.res = response.data.toString();
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
              '모델 실행',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            FutureBuilder(
              future: loadImage(),
              initialData: "",
              builder: (context, AsyncSnapshot snapshot) {
                if (home.res == "") {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ResultPage()),
                      (route) => false);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '완료',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
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
