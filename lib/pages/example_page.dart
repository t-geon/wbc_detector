import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wbc_detector/model/example.dart';

class PatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return Container();
    return Scaffold(
        appBar: AppBar(
          title: Text('Patient'),
        ),
        body: PatientList());
  }
}

class PatientList extends StatefulWidget {
  PatientList() {
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
    return ListView.builder(
        //아이템 세부정보 목록 길이를 갖는 ListView반환
        itemCount: (details != null) ? details.length : 0,
        itemBuilder: (context, position) {
          String sub = 'Date: ${details[position].time} - Content: ' +
              '${details[position].content}'; //부제목 설정(작게 써지는 것들)
          return ListTile(
            title: Text(details[position].name),
            subtitle: Text(sub),
          );
        });
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
