import 'package:cloud_firestore/cloud_firestore.dart';

class PatientDetail {
  //환자 구성요소 late안하면 초기화 에러남
  late String id;
  late String _image;
  late String _name;
  late String _content;
  late String _time;
  late String _count;

  PatientDetail(this.id, this._image, this._name, this._content, this._time,
      this._count); //생성자

  String get image => _image;
  String get name => _name;
  String get content => _content;
  String get time => _time;
  String get count => _count;

  PatientDetail.fromMap(dynamic obj) {
    //동적 객체 가져와서 Patient로 변환하는 생성자
    this.id = (obj as QueryDocumentSnapshot).id; //obj['id'];
    this._image = obj['image'];
    this._name = obj['name'];
    this._content = obj['content'];
    this._time = obj['time'];
    this._count = obj['count'];
  }

  Map<String, dynamic> toMap() {
    //patient객체를 map으로 변환
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['image'] = _image;
    map['name'] = _name;
    map['content'] = _content;
    map['time'] = _time;
    map['count'] = _count;

    return map;
  }
}
