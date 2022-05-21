//공지사항 저장된 것
class Notice {
  String title;
  String contents;

  Notice({required this.title, required this.contents});
}

// 공지 데이터
List notice = [
  Notice(title: "첫번째 공지 ", contents: "해당 어플리케이션은 DVS로 촬영한 데이터를 사용합니다."),
  Notice(title: "두번째 공지", contents: "DBSCAN, SNN, Slayer를 사용했습니다.")
];
