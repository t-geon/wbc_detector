import 'package:flutter/material.dart';
import 'package:wbc_detector/components/patient_card.dart';
import 'package:wbc_detector/model/patient.dart';

//검사목록 페이지
class ListPage extends StatelessWidget {
  static String routeName = "/list";
  final List<String> list = List.generate(10, (index) => "Text $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("검사 목록"),
      ),
      body: ListView(
        //리스트 생성
        children: List.generate(
          patients.length,
          (index) => PatientCard(patient: patients[index]),
        ),
      ),
    );
  }
}
