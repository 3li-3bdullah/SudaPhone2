import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController{
  bool showsignin = true;
  @override
  void onInit() {
    super.onInit();
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
  
}