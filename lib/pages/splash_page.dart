import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wbc_detector/constants.dart';
import 'login/login_page.dart';

class SplashPage extends StatefulWidget {
  static String routeName = "/splash";
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SvgPicture.asset(
            "assets/icons/logo.svg",
            color: Colors.white,
            width: 130,
          )),
          SizedBox(height: l_gap),
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
        ],
      )),
    );
  }
}
