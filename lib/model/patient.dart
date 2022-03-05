class Patient {
  //환자 구성요소
  final String image;
  final String title;
  final String content;
  final String time;
  final String count;

  Patient(
      //환자 생성자
      {required this.image,
      required this.title,
      required this.content,
      required this.time,
      required this.count});
}

final String _urlPrefix =
    "https://raw.githubusercontent.com/flutter-coder/ui_images/master/messenger";

//환자 목록인데 나중에 데이터 베이스로 연결해야할 듯
List<Patient> patients = [
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    title: "hong",
    content: "검사 내용",
    time: "2022/01/01",
    count: "0",
  ),
  Patient(
    image: "${_urlPrefix}_woman_1.jpg",
    title: "정도전",
    content: "검사 내용",
    time: "2022/01/02",
    count: "0",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    title: "홍길동",
    content: "검사 내용",
    time: "2022/01/02",
    count: "0",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    title: "홍길동",
    content: "검사 내용",
    time: "2022/01/03",
    count: "0",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    title: "홍길동",
    content: "검사 내용",
    time: "2022/01/04",
    count: "0",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    title: "홍길동",
    content: "검사 내용",
    time: "2022/01/05",
    count: "0",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    title: "홍길동",
    content: "검사 내용",
    time: "2022/01/06",
    count: "0",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    title: "홍길동",
    content: "검사 내용",
    time: "2022/01/07",
    count: "0",
  ),
  Patient(
    image: "${_urlPrefix}_man_1.jpg",
    title: "홍길동",
    content: "검사 내용",
    time: "2022/01/08",
    count: "0",
  ),
];
