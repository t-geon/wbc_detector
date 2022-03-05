import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wbc_detector/components/default_button.dart';
import 'package:wbc_detector/components/text_form.dart';
import 'package:wbc_detector/constants.dart';

//회원가입 페이지
class SignUpPage extends StatelessWidget {
  static String routeName = "/sign";
  final _formKey = GlobalKey<FormState>();
  final _Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("회원가입"),
        //뒤로 가기 버튼
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
              Form(key: _Key, child: TextForm("아이디")),

              //중복확인 버튼
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PrimaryColor,
                  padding: EdgeInsets.all(10),
                ),
                onPressed: () {
                  if (_Key.currentState!.validate()) {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext ctx) {
                          return AlertDialog(
                            content: Text('사용가능한 아이디입니다.'),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('확인'),
                              )
                            ],
                          );
                        });
                  }
                },
                child: Center(
                  child: Text('중복확인'),
                ),
              ),

              TextForm("비밀번호"), //text_form에 작성된 class에 아이디 전달
              SizedBox(height: l_gap),
              TextForm("비밀번호 확인"), //text_form에 작성된 class에 아이디 전달
              SizedBox(height: l_gap),

              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Text('- 개인정보 입력'),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              TextForm("이름"), //text_form에 작성된 class에 사용자 이름 전달
              SizedBox(height: l_gap),
              TextForm("핸드폰 번호 (-제외)"), //text_form에 작성된 class에 사용자 전화번호 전달
              SizedBox(height: l_gap),

              DefaultButton(
                //default_button.dart에 정의한 함수 이용해 찾기 버튼 생성
                text: "회원가입",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    //성공시 로그인 화면, 실패시(중복확인, 입력안한거) 알리기
                    Navigator.pushNamed(context, "/login");
                  }
                },
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              DefaultButton(
                //default_button.dart에 정의한 함수 이용해 취소 버튼 생성
                text: "취소",
                press: () {
                  Navigator.pushNamed(context, "/login"); //취소 버튼 누르면 계정 정보화면 이동
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
