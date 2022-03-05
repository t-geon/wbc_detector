import 'package:flutter/material.dart';
import 'package:wbc_detector/pages/home_page.dart';
import 'package:wbc_detector/pages/list/list_page.dart';
import 'package:wbc_detector/pages/login/find_id.dart';
import 'package:wbc_detector/pages/login/find_password.dart';
import 'package:wbc_detector/pages/login/login_page.dart';
import 'package:wbc_detector/pages/main_page.dart';
import 'package:wbc_detector/pages/result_page.dart';
import 'package:wbc_detector/pages/setting/id_page.dart';
import 'package:wbc_detector/pages/setting/notice_page.dart';
import 'package:wbc_detector/pages/setting/password_change_page.dart';
import 'package:wbc_detector/pages/setting/version_page.dart';
import 'package:wbc_detector/pages/setting/setting_page.dart';
import 'package:wbc_detector/pages/login/sign_up_page.dart';
import 'package:wbc_detector/pages/splash_page.dart';

final Map<String, WidgetBuilder> route = {
  SplashPage.routeName: (context) => SplashPage(),
  LoginPage.routeName: (context) => LoginPage(),
  HomePage.routeName: (context) => HomePage(),
  ListPage.routeName: (context) => ListPage(),
  ResultPage.routeName: (context) => ResultPage(),
  SettingPage.routeName: (context) => SettingPage(),
  MainPage.routeName: (context) => MainPage(),
  SignUpPage.routeName: (context) => SignUpPage(),
  IdPage.routeName: (context) => IdPage(),
  NoticePage.routeName: (context) => NoticePage(),
  VersionPage.routeName: (context) => VersionPage(),
  PasswordChangePage.routeName: (context) => PasswordChangePage(),
  FindID.routeName: (context) => FindID(),
  FindPassword.routeName: (context) => FindPassword(),
};
