//하단 메뉴 요소들
class BottomMenu {
  final int id;
  final String label;
  final String icon;

  BottomMenu({required this.id, required this.label, required this.icon});
}

List<BottomMenu> bottom_menu = [
  BottomMenu(id: 0, label: "홈", icon: "assets/icons/home.svg"),
  BottomMenu(id: 1, label: "측정결과", icon: "assets/icons/down-arrow.svg"),
  BottomMenu(id: 2, label: "검사목록", icon: "assets/icons/square.svg"),
  BottomMenu(id: 3, label: "설정", icon: "assets/icons/user.svg"),
];
