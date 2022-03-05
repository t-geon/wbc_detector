import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wbc_detector/constants.dart';
import 'package:wbc_detector/model/bottom_menu.dart';
import 'package:wbc_detector/pages/home_page.dart';
import 'package:wbc_detector/pages/list/list_page.dart';
import 'package:wbc_detector/pages/result_page.dart';
import 'package:wbc_detector/pages/setting/setting_page.dart';

class MainPage extends StatefulWidget {
  static String routeName = "/main";

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [HomePage(), ResultPage(), ListPage(), SettingPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        onTap: onTaped,
        items: List.generate(
          bottom_menu.length,
          (index) => _buildBottomNavigationBarItem(
            icon: bottom_menu[index].icon,
            label: bottom_menu[index].label,
            //현재 선택한 인덱스 번호와 bottom_menu의 id값이 같으면 true리턴
            isActive: bottom_menu[index].id == _selectedIndex ? true : false,
          ),
        ),
      ),
    );
  }

  void onTaped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _buildBottomNavigationBarItem(
      {String? icon,
      String? label,
      bool isActive = false,
      GestureTapCallback? press}) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 38,
        height: 38,
        child: IconButton(
          onPressed: press,
          icon: SvgPicture.asset(icon ?? "assets/icons/down-arrow.svg",
              color: isActive ? PrimaryColor : Colors.black),
        ),
      ),
      label: label,
    );
  }
}
