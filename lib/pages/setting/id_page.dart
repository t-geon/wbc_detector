import 'package:flutter/material.dart';
import 'package:wbc_detector/components/id_page_custtom.dart';

class IdPage extends StatelessWidget {
  static String routeName = "/id";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("계정 정보"),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: IdPageCusttom(),
      ),
    );
  }
}
