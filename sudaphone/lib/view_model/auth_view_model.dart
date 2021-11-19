import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, confirmPassword, name;

  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;
  bool showsignin = true;
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    showsignin = !showsignin;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
      Get.snackbar("Error login account", "$e",
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
      Get.snackbar("Error login account", "$e",
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
