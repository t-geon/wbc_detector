import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wbc_detector/components/default_button.dart';
import 'package:wbc_detector/components/text_form.dart';
import 'package:wbc_detector/constants.dart';
import 'package:wbc_detector/pages/login/login_page.dart';
import 'package:wbc_detector/share/authentication.dart';
import 'package:wbc_detector/theme.dart';

//회원가입 페이지
class SignUpPage extends StatefulWidget {
  static String routeName = "/login";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
//class SignUpPage extends StatelessWidget {
  static String routeName = "/sign";
  final _formKey = GlobalKey<FormState>();

  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  late Authentication auth;
  late String _userId; //인증 데이터 보관

  @override
  void initState() {
    auth = Authentication();
    super.initState();
  }

  Widget idInput() {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: TextFormField(
          controller: txtId,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: '아이디를 입력해주세요',
            enabledBorder: OutlineInputBorder(
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
          ), //입력칸 안에 써지는 글씨
          validator: (text) => text!.isEmpty
              ? '아이디를 입력해주세요.' //비어있을 때 에러문자
              : null,
        ));
  }

  //비밀번호 입력
  Widget passwordInput() {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: TextFormField(
          controller: txtPassword,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            hintText: '6글자 이상 비밀번호를 입력해주세요',
            enabledBorder: OutlineInputBorder(
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
          ),
          //입력칸 안에 써지는 글씨
          validator: (text) => text!.isEmpty
              ? '비밀번호를 입력해주세요.' //비어있을 때 에러문자
              : null,
        ));
  }

  //회원가입 버튼
  Widget signupButton() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: PrimaryColor,
            padding: EdgeInsets.all(16),
          ),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _userId = (await auth.signUp(txtId.text, txtPassword.text))!;
              print('Sign up for user $_userId');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            }
          },
          child: Center(
            child: Text(
              '가입',
              style: textTheme().subtitle1,
            ),
          ),
        ),
      ),
    );
  }

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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('아이디'),
                idInput(),
                SizedBox(height: 20),
                Text('비밀번호'),
                passwordInput(),

                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Text('- 개인정보 입력'),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                TextForm("이름"), //text_form에 작성된 class에 사용자 이름 전달
                SizedBox(height: l_gap),
                TextForm("핸드폰 번호 (-제외)"), //text_form에 작성된 class에 사용자 전화번호 전달
                SizedBox(height: l_gap),
                signupButton(),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                DefaultButton(
                  //default_button.dart에 정의한 함수 이용해 취소 버튼 생성
                  text: "취소",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
