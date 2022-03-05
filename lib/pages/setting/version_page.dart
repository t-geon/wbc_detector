import 'package:flutter/material.dart';

class VersionPage extends StatelessWidget {
  static String routeName = "/version";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("버전정보"),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: Center(child: Text("version page")),
    );
  }
}
