import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wbc_detector/pages/main_page.dart';
import '../constants.dart';

import 'home_page.dart' as home;

class ResultPage extends StatelessWidget {
  static String routeName = "/result";
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final time = TextEditingController();
  final content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("WBC Detector with DVS"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.popAndPushNamed(context, '/main'),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
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

              if (home.res != "")
                //home.res는 gif파일 이름
                Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Container(
                    child: Image.network('http://223.194.45.74:5000/show/' +
                        "${home.res + '.gif'}"),
                  ),

              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 30),
                Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "백혈구 측정치: ${home.count}",
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
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "환자 이름",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: name,
                        validator: (value) => value!.isEmpty //값 없으면 해당 문구 출력
                            ? "환자 이름을 입력해주세요." //빨간색 문구 출력
                            : null,
                        decoration: InputDecoration(
                          hintText: "환자 이름을 입력해주세요", //입력 칸 안에 비었을 때 문구
                          border: OutlineInputBorder(
                            //기본 TextFormField 디자인
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "검진 날짜",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: time,
                        validator: (value) => value!.isEmpty //값 없으면 해당 문구 출력
                            ? "검진 날짜를 입력해주세요." //빨간색 문구 출력
                            : null,
                        decoration: InputDecoration(
                          hintText: "yyyy/mm/dd에 맞게 입력해주세요", //입력 칸 안에 비었을 때 문구
                          border: OutlineInputBorder(
                            //기본 TextFormField 디자인
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "검진 내용",
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      TextFormField(
                        controller: content,
                        validator: (value) => value!.isEmpty //값 없으면 해당 문구 출력
                            ? "검진 내용을 입력해주세요." //빨간색 문구 출력
                            : null,
                        decoration: InputDecoration(
                          hintText: "검진 내용을 입력해주세요", //입력 칸 안에 비었을 때 문구
                          border: OutlineInputBorder(
                            //기본 TextFormField 디자인
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          child: Text(
                            '        등록하기        ',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: PrimaryColor,
                              elevation: 0.0,
                              minimumSize: Size.fromRadius(25),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext ctx) {
                                  return AlertDialog(
                                    title: Text('검진 내용 등록.'), //제목
                                    content:
                                        Text('검진 내용 등록을 성공적으로 완료했습니다.'), //내용
                                    actions: [
                                      FlatButton(
                                        onPressed: () {
                                          final userCollectionReference =
                                              FirebaseFirestore.instance
                                                  .collection(
                                                      "patient_details");
                                          userCollectionReference.add({
                                            "content": content.text,
                                            "count": home.count,
                                            "name": name.text,
                                            "time": time.text,
                                            "image": home.res
                                          });
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder:
                                                      (BuildContext context) =>
                                                          MainPage()),
                                              (route) => false);
                                        },
                                        child: Text('확인'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
