import 'package:flutter/material.dart';
import 'package:wbc_detector/components/patient_card.dart' as pc;

//검사목록에서 환자 누르면 들어오는 상세 페이지
class ListDetailPage extends StatefulWidget {
  @override
  _ListDetailPageState createState() => _ListDetailPageState();
}

class _ListDetailPageState extends State<ListDetailPage> {
  @override
  Widget build(BuildContext context) {
    //상세 페이지에 쓰일 것들
    print(pc.select.name);
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
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "백혈구 관찰 결과",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Container(
                  child: Image.network('http://192.168.219.100:5000/show/' +
                      "${pc.select.image + '.gif'}"), //결과 이미지 가져오기
                ),
              ),

              SizedBox(height: 30),
              Container(
                  width: 500,
                  child: Divider(color: Colors.black, thickness: 2.0)), //실선
              SizedBox(height: 15),
              Text(
                "검사 내용",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 20),

              Text("환자 이름 : ${pc.select.name}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),

              Text("검사 날짜 : ${pc.select.time}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),

              Text("검사 내용 : ${pc.select.content}",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
