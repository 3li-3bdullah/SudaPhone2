import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/mydrawer.dart';

class LoginViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, confirmPassword, name;

  final Rxn<User> _user = Rxn<User>();
  String? get user => _user.value?.email;
  RxBool showsignin = true.obs;
   changVal() {
   return showsignin.value = !showsignin.value;
  }

   signin(GlobalKey<FormState> signinKey) {
    signinKey.currentState!.save();
    if (signinKey.currentState!.validate()) {
      signInWithEmailAndPassword();
    }
    Get.defaultDialog(
      title: "تم تسحيل دخولك بنجاح",
      textCancel: "إلغاء",
      textConfirm: "تم",
      buttonColor: Colors.green,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        Get.offAll(
          MyDrawer(),
          transition: Transition.zoom,
        );
      },
      radius: 30,
    );
  }
   signup(GlobalKey<FormState> signupKey) {
    signupKey.currentState!.save();
    if (signupKey.currentState!.validate()) {
      signUpWithEmailAndPassword();
    }

    Get.defaultDialog(
      title: "تم إنشاء الحساب بنجاح",
      textCancel: "إلغاء",
      textConfirm: "تم",
      buttonColor: Colors.green,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        Get.offAll(
          MyDrawer(),
          transition: Transition.zoom,
        );
      },
      radius: 30,
    );
  }
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar("Error login account", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("Error login account", e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
