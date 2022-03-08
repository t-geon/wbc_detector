/*
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class Authentication {
  final auth.FirebaseAuth _firebaseAuth =
      auth.FirebaseAuth.instance; //파이어베이스 Authentication 메소드 이용 객체

  Future<String> login(String email, String password) async {
    //로그인
    auth.UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    auth.User user = userCredential.user;
    return user.uid;
  }

  Future<String> signUp(String email, String password) async {
    //회원가입
    auth.UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    auth.User user = userCredential.user;
    return user.uid;
  }

  Future<void> signOut() async {
    //로그아웃
    return _firebaseAuth.signOut();
  }

  Future<auth.User> getUser() async {
    //현재 사용중인 사용자 가져오기
    auth.User user = _firebaseAuth.currentUser;
    return user;
  }
}
*/
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class Authentication {
  final auth.FirebaseAuth _firebaseAuth =
      auth.FirebaseAuth.instance; //파이어베이스 Authentication 메소드 이용 객체

  Future<String?> login(String email, String password) async {
    //로그인
    auth.UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);

    auth.User? user = userCredential.user;
    return user?.uid;
  }

  Future<String?> signUp(String email, String password) async {
    //회원가입
    auth.UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    auth.User? user = userCredential.user;
    return user?.uid;
  }

  Future<void> signOut() async {
    //로그아웃
    return _firebaseAuth.signOut();
  }

  Future<auth.User?> getUser() async {
    //현재 사용중인 사용자 가져오기
    auth.User? user = _firebaseAuth.currentUser;
    return user;
  }
}
