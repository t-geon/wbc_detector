import 'package:flutter/material.dart';
import 'package:wbc_detector/model/text_menu.dart';
import '../../components/text_menu_card.dart';

//setting화면의 구성을 만드는 곳
class SettingCustom extends StatelessWidget {
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
                title: settingMenuList[index].text,
                icon: settingMenuList[index].icon,
                press: () {
                  Navigator.pushNamed(
                      context, "${settingMenuList[index].path}");
                },
              ),
            ),
            separatorBuilder: (context, index) => Divider(
              height: 0,
            ),
            itemCount: settingMenuList.length,
          ),
        ),
      ],
    );
  }

  //약간의 공백 두고 새로운 textmenucard생성할 때 사용
  Padding buildPaddingTextMenuCard(String text, GestureTapCallback press) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: SizedBox(
        height: 55,
        child: TextMenuCard(
          title: text,
          icon: "assets/icons/right-arrow.svg",
          press: press,
          textColor: Colors.black,
        ),
      ),
    );
  }
}
