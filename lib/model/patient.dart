class Patient {
  //환자 구성요소
  final String image;
  final String name;
  final String content;
  final String time;

  Patient(
      //환자 생성자
      {required this.image,
      required this.name,
      required this.content,
      required this.time});
}

final String _urlPrefix =
    "https://raw.githubusercontent.com/flutter-coder/ui_images/master/messenger";

//환자 목록인데 나중에 데이터 베이스로 연결해야할 듯
List<Patient> patients = [
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    name: "hong",
    content: "검사 내용",
    time: "2022/01/01",
  ),
  Patient(
    image: "${_urlPrefix}_woman_1.jpg",
    name: "정도전",
    content: "검사 내용",
    time: "2022/01/02",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    name: "홍길동",
    content: "검사 내용",
    time: "2022/01/02",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    name: "홍길동",
    content: "검사 내용",
    time: "2022/01/03",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    name: "홍길동",
    content: "검사 내용",
    time: "2022/01/04",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    name: "홍길동",
    content: "검사 내용",
    time: "2022/01/05",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    name: "홍길동",
    content: "검사 내용",
    time: "2022/01/06",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    name: "홍길동",
    content: "검사 내용",
    time: "2022/01/07",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    name: "홍길동",
    content: "검사 내용",
    time: "2022/01/08",
  ),
];
