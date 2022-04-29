import 'package:flutter/material.dart';
import 'package:wbc_detector/components/default_button.dart';

import '../components/text_form.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  static String routeName = "/result";
  final _formKey = GlobalKey<FormState>();

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

              Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Container(
                  child:
                      //Image.network('http://geon2331.pythonanywhere.com/static/book.jpg'), //결과 이미지 가져오기
                      Image.network(
                          'http://192.168.219.102:5000/show/2022041016213420.gif'), //서버에 있는 이미지 읽어오기
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
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      TextForm("환자 이름"),
                      SizedBox(height: 10),
                      TextForm("검사 날짜"),
                      SizedBox(height: 10),
                      TextForm("검사 내용"),

                      //검사내용 입력(내용에 맞게 늘어남)
                      /*Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("검사 내용"),
                          Row(children: const [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                  hintText: '검사 내용을 입력해주세요',
                                  border: OutlineInputBorder(
                                    //기본 TextFormField 디자인
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ])
                        ],
                      ),*/
                      SizedBox(height: 20),
                      DefaultButton(
                        //default_button.dart에 정의한 함수 이용해 찾기 버튼 생성
                        text: "검사 내용 등록",
                        press: () {
                          if (_formKey.currentState!.validate()) {
                            //성공시 아이디 알려주고, 실패시 없는 정보라고 알리기
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
