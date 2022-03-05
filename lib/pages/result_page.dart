import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  static String routeName = "/result";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("측정 결과"),
      ),
      body: Center(child: Text("result page")),
    );
  }
}
