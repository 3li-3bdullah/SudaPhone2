import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, name;
  final bool showsignin = true;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    showsignin != showsignin;
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print(e);
      Get.snackbar("Error login account", "$e",
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
