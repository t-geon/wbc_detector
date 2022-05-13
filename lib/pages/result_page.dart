import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wbc_detector/components/default_button.dart';

import '../components/text_form.dart';
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
        title: Text("측정 결과"),
      ),
      //body: Center(child: Text("result page")),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
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

              //여기서 변수로 해당 response값 저장해두기 ->나중에 image에다가 넣어서 데이터베이스에 저장
              if (home.res != "")
                Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Container(
                    //여기서 서버컴 주소로 바꿔야함
                    child: Image.network('http://192.168.219.100:5000/show/' +
                        "${home.res + '.gif'}"), //결과 이미지 가져오기오기
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
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("환자 이름", textAlign: TextAlign.start),
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
                      //TextForm("환자 이름"),
                      SizedBox(height: 10),
                      Text("검사 날짜", textAlign: TextAlign.start),
                      TextFormField(
                        controller: time,
                        validator: (value) => value!.isEmpty //값 없으면 해당 문구 출력
                            ? "검사 날짜를 입력해주세요." //빨간색 문구 출력
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
                      //TextForm("검사 내용"),
                      SizedBox(height: 10),
                      Text("검사 내용", textAlign: TextAlign.start),
                      TextFormField(
                        controller: content,
                        validator: (value) => value!.isEmpty //값 없으면 해당 문구 출력
                            ? "검사 내용을 입력해주세요." //빨간색 문구 출력
                            : null,
                        decoration: InputDecoration(
                          hintText: "검사 내용을 입력해주세요", //입력 칸 안에 비었을 때 문구
                          border: OutlineInputBorder(
                            //기본 TextFormField 디자인
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      DefaultButton(
                        //default_button.dart에 정의한 함수 이용해 찾기 버튼 생성
                        text: "검사 내용 등록",
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext ctx) {
                                return AlertDialog(
                                  title: Text('검사 내용 등록.'), //제목
                                  content: Text('검사 내용 등록을 성공적으로 완료했습니다.'), //내용
                                  actions: [
                                    FlatButton(
                                      onPressed: () {
                                        final userCollectionReference =
                                            FirebaseFirestore.instance
                                                .collection("patient_details");
                                        //.doc();
                                        userCollectionReference.add({
                                          "content": content.text,
                                          "name": name.text,
                                          "time": time.text,
                                          "image": home.res
                                        });
                                        Navigator.pushNamed(context, "/main");
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
