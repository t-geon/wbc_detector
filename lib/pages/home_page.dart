import 'package:flutter/material.dart';
import 'package:wbc_detector/constants.dart';
import 'package:wbc_detector/pages/load.dart';

String res = "input1";
String count = "10";

class HomePage extends StatelessWidget {
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
