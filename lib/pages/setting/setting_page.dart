import 'package:flutter/material.dart';
import 'package:wbc_detector/components/setting_custtom.dart';

//설정화면
class SettingPage extends StatelessWidget {
  static String routeName = "/setting";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("WBC Detector with DVS"),
      ),
      body: SingleChildScrollView(
        child: SettingCustom(),
      ),
    );
  }
}
