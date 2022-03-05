import 'package:flutter/material.dart';
import 'package:wbc_detector/components/default_button.dart';
import 'package:wbc_detector/components/text_form.dart';
import 'package:wbc_detector/constants.dart';

class FindPassword extends StatelessWidget {
  static String routeName = "/find_password";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("비밀번호 찾기"),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              onPressed: () => Navigator.pop(context)),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                TextForm("이름"), //text_form에 작성된 class에 사용자 이름 전달
                SizedBox(height: l_gap),
                TextForm("핸드폰 번호 (-제외)"), //text_form에 작성된 class에 사용자 전화번호 전달
                SizedBox(height: l_gap),
                TextForm("아이디"), //text_form에 작성된 class에 아이디 전달
                SizedBox(height: l_gap),
                DefaultButton(
                  //default_button.dart에 정의한 함수 이용해 찾기 버튼 생성
                  text: "비밀번호 찾기",
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      //성공시 비밀번호 알려주고, 실패시 없는 정보라고 알리기
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            title: Text('비밀번호를 찾았습니다.'), //제목
                            content: Text('찾은 비밀번호~~~~~'), //내용
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "/login");
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
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                DefaultButton(
                  //default_button.dart에 정의한 함수 이용해 취소 버튼 생성
                  text: "취소",
                  press: () {
                    Navigator.pushNamed(
                        context, "/login"); //취소 버튼 누르면 계정 정보화면 이동
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
