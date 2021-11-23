import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/auth/login.dart';
import 'package:sudaphone/view/mydrawer.dart';
import 'package:sudaphone/view_model/auth_view_model.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null) ?  MyDrawer() : LogIn();
    });
  }
}
