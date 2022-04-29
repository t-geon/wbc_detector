import 'package:flutter/material.dart';
import 'package:wbc_detector/components/patient_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wbc_detector/model/patient.dart';

class ListPage extends StatelessWidget {
  static String routeName = "/list";

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: PatientList());
  }
}

class PatientList extends StatefulWidget {
  PatientList({Key? key}) : super(key: key) {
    Firebase.initializeApp();
  }

  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  List<PatientDetail> details = []; //firestore의 인스턴스  저장될 list

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
          (details != null) ? details.length : 0,
          (position) => PatientCard(details: details[position]),
          //patientcard에 details전달해서 검사목록생성
        ),
      ),
    );
  }

  void initState() {
    //화면이 로드 되면 getDetailList 호출하고 시간 지나면 정보 업데이트 된다.
    if (mounted) {
      getDetailList().then((data) {
        setState(() {
          details = data;
        });
      });
    }
    super.initState();
  }

  //getDetailList는 State가 변경될 때마다 호출되기 때문에 build안에서 호출하면 안됨 -> 무한루프 문제생김
  //getDetailList는 위젯 생성될 때 호출
  Future<List<PatientDetail>> getDetailList() async {
    //cloud firestore의 patient_details컬랙션에서 가져온다
    var data = await db.collection('patient_details').get();

    if (data != null) {
      //data가 null이 아닐 때 id를 문서의 id인스턴스로 설정
      details =
          data.docs.map((document) => PatientDetail.fromMap(document)).toList();

      int i = 0;
      details.forEach((detail) {
        detail.id = data.docs[i].id;
        i++;
      });
    }
    return details;
  }
}
