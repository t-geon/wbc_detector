import 'package:flutter/material.dart';
import 'package:wbc_detector/components/default_button.dart';
import 'package:wbc_detector/components/text_form.dart';
import 'package:wbc_detector/constants.dart';

//비밀번호 변경 페이지
class PasswordChangePage extends StatelessWidget {
  static String routeName = "/passwordchange";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("비밀번호 변경"),
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
                TextForm("기존 비밀번호 입력"), //text_form에 작성된 class에 기존 비밀번호 전달
                SizedBox(height: l_gap),
                TextForm("변경할 비밀번호 입력"), //text_form에 작성된 class에 변경할 비밀번호 전달
                SizedBox(height: l_gap),
                TextForm("변경할 비밀번호 확인"), //text_form에 작성된 class에 변경할 비밀번호 전달
                SizedBox(height: l_gap),
                DefaultButton(
                  //default_button.dart에 정의한 함수 이용해 변경 버튼 생성
                  text: "변경",
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(
                          context, "/login"); //비밀번호 변경 후 login으로 이동
                    }
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                DefaultButton(
                  //default_button.dart에 정의한 함수 이용해 취소 버튼 생성
                  text: "취소",
                  press: () {
                    Navigator.pop(context);
                    //Navigator.pushNamed(context, "/id"); //취소 버튼 누르면 계정 정보화면 이동
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
