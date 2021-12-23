import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/my_drawer.dart';
import 'package:sudaphone/view/screen.dart';
import 'package:sudaphone/view_model/splash_screen_view_model.dart';

class SplashScreen extends GetWidget<SplashScreenViewModel> {
  final scontroller = Get.lazyPut(() => SplashScreenViewModel());
   SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Stack(
        drawerHolder(),
        screenHolder(),
      ),
    );
  }

  // Widget drawerHolder -----------
  Widget drawerHolder() => SafeArea(
          child: MyDrawer(
        onSelectedDrawerItem: (e) {},
      ));
  // Widget screenHolder -----------
  Widget screenHolder() {
    return Obx(() =>  ClipRRect(
          borderRadius: BorderRadius.circular(controller.isDrawerOpen!.value ? 20 : 0), child: Screen()),
    );
  }
}
