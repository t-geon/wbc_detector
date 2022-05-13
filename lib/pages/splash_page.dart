import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wbc_detector/constants.dart';
import 'package:wbc_detector/pages/login/loading_page.dart';
import 'login/login_page.dart';

class SplashPage extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: xl_gap),
          SizedBox(height: xl_gap),
          Center(
              child: SvgPicture.asset(
            "assets/icons/logo.svg",
            color: Colors.white,
            width: 130,
          )),
          SizedBox(height: l_gap),
          Center(
            child: Text("WBC Detector",
                style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          SizedBox(height: s_gap),
          Center(
            child: Text("with DVS",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
          SizedBox(height: xl_gap),
          Expanded(
            //터치 해서 넘어가는 글자 삽입
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: TextButton(
                child: Text(
                  "진행하려면 터치해주세요.",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginPage()),
                      (route) => false);
                  //Navigator.push(context,MaterialPageRoute(builder: (context) => LoadingPage()));
                },
              ),
            ),
          ),
        ],
      )),
    );
  }

  void _completeSplash(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => widget));
  }
}
