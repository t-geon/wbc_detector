import 'package:flutter/material.dart';
import 'package:wbc_detector/constants.dart';

//문자 입력하는 입력 위젯
class TextForm extends StatelessWidget {
  final String text;
  const TextForm(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        SizedBox(height: s_gap),
        TextFormField(
          validator: (value) => value!.isEmpty //값 없으면 해당 문구 출력
              ? "${text}를 입력해주세요." //빨간색 문구 출력
              : null,
          obscureText: //TextFromField가 비밀번호 입력이면 *처리하기
              text == "비밀번호"
                  ? true //true이면 *표시 됨
                  : text == "기존 비밀번호 입력"
                      ? true
                      : text == "변경할 비밀번호 입력"
                          ? true
                          : text == "변경할 비밀번호 확인"
                              ? true
                              : text == "변경할 비밀번호 확인"
                                  ? true
                                  : text == "비밀번호 확인"
                                      ? true
                                      : false,
          decoration: InputDecoration(
            hintText: text == "검사 날짜"
                ? "yyyy/mm/dd에 맞게 입력해주세요"
                : "$text를 입력해주세요", //입력 칸 안에 비었을 때 문구
            border: OutlineInputBorder(
              //기본 TextFormField 디자인
              borderRadius: BorderRadius.all(Radius.circular(20)),
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          /*enabledBorder: OutlineInputBorder(
              //기본 TextFormField 디자인
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              //터치시 TextFormField 디자인
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              //에러 발생시 TextFormField 디자인
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              //에러 발생 후 터치 시 TextFormField 디자인
              borderRadius: BorderRadius.circular(20),
            ),
          ),*/
        ),
      ],
    );
  }
}
