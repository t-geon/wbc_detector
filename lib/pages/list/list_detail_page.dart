import 'package:flutter/material.dart';

//검사목록에서 환자 누르면 들어오는 상세 페이지
class ListDetailPage extends StatefulWidget {
  @override
  _ListDetailPageState createState() => _ListDetailPageState();
}

class _ListDetailPageState extends State<ListDetailPage> {
  @override
  Widget build(BuildContext context) {
    //상세 페이지에 쓰일 것들
    return Container(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("검사 상세 내용"),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () => Navigator.pop(context)),
        ),
      ),
    );
  }
}
