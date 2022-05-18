import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:wbc_detector/constants.dart';
import 'package:wbc_detector/pages/load.dart';
import 'package:wbc_detector/pages/result_page.dart';

String res = "";

Future<void> loadImage() async {
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
    baseUrl: 'https://www.xx.com/api',
    connectTimeout: 0,
    receiveTimeout: 0,
  );

  Dio dio = Dio(options);

  //res = "2022041016213420";

  /*
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
      res = response.data.toString();
    } else {
      print("error: in loadImage method!");
    }
  } catch (e) {
    print("error occur in trying phrase");
    print(e);
  }

   */
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//class HomePage extends StatelessWidget {
  static String routeName = "/home";
  String name = "";

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
              '백혈구 검진 파일 등록 ',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 30),
            Text(
              '아래 버튼을 이용해 검진할 파일을 선택해주세요 :)',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 80),
            ElevatedButton(
              //파일선택 클릭시 파일 선택할 수 있도록 만들기
              style: ElevatedButton.styleFrom(
                primary: PrimaryColor,
                padding: EdgeInsets.all(16),
              ),
              onPressed: () async {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoadPage()),
                    (route) => false);

                //res = "2022041016213420";

                //loadImage(); //파일 선택 후 서버에 전달

                /*if (res != "") {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ResultPage()),
                      (route) => false);
                } else {
                  showDialog(
                    context: context,
                    barrierDismissible: false, //바깥 터치 불가능
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("모델이 돌아가고 있습니다."),
                        content: CircularProgressIndicator(),
                      );
                    },
                  );
                }

                 */

                /*
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ResultPage()),
                    (route) => false);
   */
                /*
                final result = await FilePicker.platform.pickFiles();

                //final result = await FilePicker.platform.pickFiles(allowMultiple: true);
                //위 코드는 파일 여러개 선택
                if (result == null) return; //아무것도 선택 안함

                //하나의 파일 open
                final file = result.files.first;
                //openFile(file);

                print('Name: ${file.name}');
                print('Bytes: ${file.bytes}');
                print('Size: ${file.size}');
                print('Extension: ${file.extension}');
                print('Path: ${file.path}'); //파일을 읽어서 캐시에 옮긴 경로
                //한번 끄면 캐시에서 지워지기 때문에 계속 사용은 불가

                name = file.name; //파일 이름 저장해서 db에 name으로 저장
                response = "2022041016213420";

                final newFile =
                    await saveFilePermanently(file); //파일을 newFile에 반환

                print('From Path: ${file.path}'); //원래 파일
                print('To Path: ${newFile.path}'); //파일을 영구적으로 보관하는 경로
                */
              },
              child: Text(
                "등록하러 가기",
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
