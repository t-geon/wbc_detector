import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wbc_detector/constants.dart';
import 'package:wbc_detector/model/bottom_menu.dart';
import 'package:wbc_detector/pages/home_page.dart';
import 'package:wbc_detector/pages/list/list_page.dart';
import 'package:wbc_detector/pages/result_page.dart';
import 'package:wbc_detector/pages/setting/setting_page.dart';

//bottom menu만드는 page (main page안에 home, result, list, setting 열린다고 생각하면 된다.)
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
