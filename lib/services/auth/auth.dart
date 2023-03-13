import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth with ChangeNotifier {
  late final User _user;
  User get user => _user;
  final _firebaseAuth = FirebaseAuth.instance;
  Future<User?> signIn() async {
    final crediencial = await _firebaseAuth.signInAnonymously();
    //_user = crediencial.user!.uid as User;
    return crediencial.user;
  }

  void signOut() {
    _firebaseAuth.signOut();
  }
}
