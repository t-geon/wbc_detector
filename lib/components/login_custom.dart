import 'package:flutter/material.dart';
import 'package:wbc_detector/components/default_button.dart';
import 'package:wbc_detector/components/text_form.dart';
import 'package:wbc_detector/constants.dart';
import 'package:wbc_detector/pages/login/find_id.dart';
import 'package:wbc_detector/pages/login/find_password.dart';

//로그인 양식 작성된 곳
class LoginCustom extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextForm("아이디"), //text_form에 작성된 class에 Email 전달
          SizedBox(height: m_gap),
          TextForm("비밀번호"), //text_form에 작성된 class에 Password 전달
          SizedBox(height: l_gap),
          DefaultButton(
            text: "로그인",
            press: () {
              if (_formKey.currentState!.validate()) {
                //실패하면 find_id에서 팝업 띄우는거 사용해서 실패 팝업 띄우기
                Navigator.pushNamed(context, "/main"); //로그인 버튼 누르면 홈으로 이동
              }
            },
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          DefaultButton(
            text: "회원가입",
            press: () {
              Navigator.pushNamed(context, "/sign"); //회원가입 버튼 누르면 회원가입으로 이동
            },
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          TextButton(
            child: Text(
              "아이디를 잊으셨나요?",
              style: TextStyle(fontSize: 15),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => FindID()));
            },
          ),
          TextButton(
            child: Text(
              "비밀번호를 잊으셨나요?",
              style: TextStyle(fontSize: 15),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FindPassword()));
            },
          )
        ],
      ),
    );
  }
}
