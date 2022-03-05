//옵션에 들어가는 메뉴들
class TextMenu {
  String? text; //메뉴 이름
  String? icon;
  String? path; //메뉴 클릭시 이동 경로

  TextMenu({this.text, this.icon, this.path});
}

List<TextMenu> settingMenuList = [
  //옵션 화면 메뉴
  TextMenu(text: "계정 정보", icon: "assets/icons/right-arrow.svg", path: "/id"),
  TextMenu(text: "공지사항", icon: "assets/icons/right-arrow.svg", path: "/notice"),
];

List<TextMenu> idMenuList = [
  //계정 정보 화면
  TextMenu(text: "로그아웃", icon: "assets/icons/right-arrow.svg", path: "/login"),
  TextMenu(
      text: "비밀번호 변겅",
      icon: "assets/icons/right-arrow.svg",
      path: "/passwordchange"),
  TextMenu(text: "회원탈퇴", icon: "assets/icons/right-arrow.svg", path: "/"),
];
