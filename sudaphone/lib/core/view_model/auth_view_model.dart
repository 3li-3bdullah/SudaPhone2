import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/mydrawer.dart';

class AuthViewModel extends GetxController {
  bool showsignin = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, name;

  final Rx<User> _user = Rx<User>();
  String get user => _user.value.email!;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(MyDrawer());
    } catch (e) {
      print(e);
      Get.snackbar('Error login account', '$e',
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
