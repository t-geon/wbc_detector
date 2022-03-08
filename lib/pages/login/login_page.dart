import 'package:flutter/material.dart';
import 'package:wbc_detector/constants.dart';
import 'package:wbc_detector/pages/login/find_id.dart';
import 'package:wbc_detector/pages/login/find_password.dart';
import 'package:wbc_detector/pages/login/loading_page.dart';
import 'package:wbc_detector/pages/login/sign_up_page.dart';
import 'package:wbc_detector/pages/main_page.dart';
import 'package:wbc_detector/share/authentication.dart';
import 'package:wbc_detector/theme.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  bool _isLogin = true; //로그인 수행
  late String _userId; //인증 데이터 보관
  late String _password; //인증 데이터 보관
  late String _id; //인증 데이터 보관
  String _message = ""; //오류 메세지 보관

  late Authentication auth;

  @override
  void initState() {
    auth = Authentication();
    super.initState();
  }

  //아이디 입력
  Widget idInput() {
    return Padding(
        padding: EdgeInsets.only(top: 50),
        child: TextFormField(
          controller: txtId,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: '아이디',
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
        padding: EdgeInsets.only(top: 30),
        child: TextFormField(
          controller: txtPassword,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            hintText: '비밀번호',
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

  //로그인 버튼
  Widget loginButton() {
    return Padding(
      padding: EdgeInsets.only(top: 25),
      child: Container(
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: PrimaryColor,
            padding: EdgeInsets.all(16),
          ),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _userId = (await auth.login(txtId.text, txtPassword.text))!;
              print('Login for user $_userId');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoadingPage()));
            }
          },
          child: Center(
            child: Text(
              '로그인',
              style: textTheme().subtitle1,
            ),
          ),
        ),
      ),
    );
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
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
          child: Center(
            child: Text(
              '회원가입',
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: xl_gap),
                Text(
                  'WBC Detector \n 로그인',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                idInput(),
                passwordInput(),
                loginButton(),
                signupButton(),
                SizedBox(height: m_gap),
                TextButton(
                  child: Text(
                    "아이디를 잊으셨나요?",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FindID()));
                  },
                ),
                TextButton(
                  child: Text(
                    "비밀번호를 잊으셨나요?",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FindPassword()));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
