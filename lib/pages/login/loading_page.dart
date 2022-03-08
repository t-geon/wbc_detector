import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wbc_detector/pages/login/login_page.dart';
import 'package:wbc_detector/pages/main_page.dart';
import 'package:wbc_detector/share/authentication.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    Authentication auth = Authentication();
    auth.getUser().then((user) {
      MaterialPageRoute route;
      if (user != null) {
        //유저 생기면 로그인 성공해서 데이터 가져온거기 때문에 main으로 이동
        route = MaterialPageRoute(builder: (context) => MainPage());
      } else {
        //유저가 null이면 로그인 못한거로 login으로 이동
        route = MaterialPageRoute(builder: (context) => LoginPage());
      }
      Navigator.pushReplacement(context, route);
    }).catchError((err) => print(err));
  }
}
