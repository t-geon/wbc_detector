import 'package:flutter/material.dart';
import 'package:wbc_detector/constants.dart';
import 'package:wbc_detector/pages/login/find_id.dart';
import 'package:wbc_detector/pages/login/find_password.dart';
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

  Widget mainButton() {
    String buttonText = _isLogin ? '로그인' : '회원가입';
    return Padding(
        padding: EdgeInsets.only(top: 50),
        child: Container(
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: PrimaryColor,
                padding: EdgeInsets.all(16),
              ),
              onPressed: submit,
              child: Center(
                child: Text(
                  buttonText,
                  style: textTheme().subtitle1,
                ),
              ),
            )));
    /*RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: PrimaryColor,
              elevation: 3,
              child: Text(buttonText),
              onPressed: submit,
            )));*/
  }

  Future submit() async {
    setState(() {
      _message = "";
    });
    try {
      if (_isLogin) {
        _userId = (await auth.login(txtId.text, txtPassword.text))!;
        print('Login for user $_userId');
      } else {
        _userId = (await auth.signUp(txtId.text, txtPassword.text))!;
        print('Sign up for user $_userId');
      }
      if (_userId != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        //_message = e.message;
      });
    }
  }

  Widget secondaryButton() {
    String buttonText = !_isLogin ? '로그인' : '회원가입';
    return FlatButton(
        child: Text(buttonText),
        onPressed: () {
          setState(() {
            _isLogin = !_isLogin;
          });
        });
  }

  Widget validationMessage() {
    return Text(
      _message,
      style: TextStyle(
          fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
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
                mainButton(),
                secondaryButton(),
                validationMessage(),
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
  /*Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          child: ListView(
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
              //Logo("Login"), //"Login"을 Logo에 전달
              //LoginCustom(),
              idInput(),
              passwordInput(),
              mainButton(),
              secondaryButton(),
              validationMessage(),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FindPassword()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }*/
}

/* 가장 기본
import 'package:flutter/material.dart';
import 'package:wbc_detector/components/login_custom.dart';
import 'package:wbc_detector/constants.dart';

class LoginPage extends StatelessWidget {
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
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
            //Logo("Login"), //"Login"을 Logo에 전달
            SizedBox(height: l_gap),
            LoginCustom(),
          ],
        ),
      ),
    );
  }
}
*/

/*동훈이 버전
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wbc_detector/components/default_button.dart';
import 'package:wbc_detector/constants.dart';
import 'find_id.dart';
import 'find_password.dart';
import '../splash_page.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _secureText = true;
  final _formKey = GlobalKey<FormState>();
  final _authentication = FirebaseAuth.instance;

  String userEmail = '';
  String userPassword = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // GestureDetector widget 이용해서 unfocus 기능 구현
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
                //Logo("Login"), //"Login"을 Logo에 전달
                SizedBox(height: l_gap),
                TextFormField(
                  key: ValueKey(1),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address.';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "아이디를 입력하세요.",
                    labelText: "ID",
                    labelStyle: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    // TextField테두리 설정
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false, // 입력하는 동안 보이도록 설정
                  maxLength: 20, // 20글자로 제한
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  key: ValueKey(2),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 7) {
                      return 'Password must be at least 7 characters long.';
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "비밀번호를 입력하세요.",
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      // TextField테두리 설정
                      border: OutlineInputBorder(),
                      // icon button 이용해 obscureText 속성 값을 변경해준다.
                      suffixIcon: IconButton(
                        icon: Icon(_secureText
                            ? Icons.remove_red_eye
                            : Icons.security),
                        onPressed: () {
                          setState(() {
                            _secureText = !_secureText;
                          });
                        },
                      )),
                  obscureText: _secureText,
                ),
                SizedBox(
                  height: 20.0,
                ),
                // 로그인 버튼
                DefaultButton(
                    text: '로그인',
                    press: () async {
                      _tryValidation();
                      try {
                        final newUser =
                            await _authentication.signInWithEmailAndPassword(
                          email: userEmail,
                          password: userPassword,
                        );
                        if (newUser.user != null) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SplashPage();
                          }));
                        }
                      } catch (e) {
                        print(e);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Please check your email and password'),
                          backgroundColor: Colors.blue,
                        ));
                      }
                    }),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                // 회원가입 버튼
                DefaultButton(
                  //default_button.dart에 정의한 함수 이용해 회원가입 버튼 생성
                  text: "회원 가입",
                  press: () {
                    Navigator.pushNamed(
                        context, "/sign"); //회원가입 버튼 누르면 회원가입으로 이동
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                TextButton(
                  child: Text(
                    "아이디를 잊으셨나요?",
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    // 아이디 찾는 페이지로 이동
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
                    // 비밀번호 찾는 페이지로 이동
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

 */
