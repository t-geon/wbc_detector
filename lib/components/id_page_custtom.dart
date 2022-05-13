import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wbc_detector/model/text_menu.dart';
import 'package:wbc_detector/pages/home_page.dart';
import 'package:wbc_detector/pages/login/login_page.dart';
import 'package:wbc_detector/share/authentication.dart';
import '../../components/text_menu_card.dart';

//setting화면의 구성을 만드는 곳
class IdPageCusttom extends StatelessWidget {
  final Authentication auth = new Authentication();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 330,
          child: ListView.separated(
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) => SizedBox(
              height: 55,
              child: TextMenuCard(
                title: idMenuList[index].text,
                icon: idMenuList[index].icon,
                press: () {
                  //text_menu 누르면 path가 /인경우에는 팝업 띄운다.
                  if (idMenuList[index].path == "/") {
                    //회원탈퇴 누른경우
                    showDialog(
                        context: context,
                        barrierDismissible: false, //바깥 터치 불가능
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("회원탈퇴"),
                            content: Text("정말 탈퇴하시겠습니까?"),
                            actions: [
                              FlatButton(
                                  //예 버튼 만들기, 버튼 클릭시 이동
                                  onPressed: () {
                                    FirebaseAuth.instance.currentUser?.delete();
                                    Navigator.of(context).pop(); //팝업 닫기
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                LoginPage()),
                                        (route) => false);
                                  },
                                  child: Text("예")),
                              FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); //팝업닫기
                                    Navigator.pushNamed(
                                        context, "/"); //현재 페이지 유지
                                  },
                                  child: Text("아니오")),
                            ],
                          );
                        });
                  } else if (idMenuList[index].path == "/login") {
                    //로그아웃 누른 경우
                    auth.signOut().then((result) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginPage()),
                          (route) => false);
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    });
                  } else {
                    //경로가 정해진 경우 해당 경로로 이동
                    Navigator.pushNamed(context, "${idMenuList[index].path}");
                  }
                },
              ),
            ),
            separatorBuilder: (context, index) => Divider(
              height: 0,
            ),
            itemCount: idMenuList.length,
          ),
        ),
      ],
    );
  }
}
