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
    print(pc.select.image);
    return Container(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("검진 상세 내용"),
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
                "검진 영상",
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
                  child: Image.network(
                      'http://223.194.45.74:5000/show/${pc.select.image}' +
                          '.gif'),
                ),
              ),

              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "백혈구 측정치: ${pc.select.count}",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ]),

              SizedBox(height: 30),
              Container(
                  width: 500,
                  child: Divider(color: Colors.black, thickness: 2.0)), //실선
              SizedBox(height: 15),
              Text(
                "검진 내용",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 20),

              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    "환자 이름 : ",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(" ${pc.select.name}", style: TextStyle(fontSize: 17)),
                ],
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    "검진 날짜 : ",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(" ${pc.select.time}", style: TextStyle(fontSize: 17)),
                ],
              ),

              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    "검진 내용",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Text("${pc.select.content}",
                    style: TextStyle(fontSize: 17)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
