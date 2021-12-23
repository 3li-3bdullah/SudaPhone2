import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/model/drawer_model.dart';
import 'package:sudaphone/view/my_drawer.dart';
import 'package:sudaphone/view/screen.dart';
import 'package:sudaphone/view_model/splash_screen_view_model.dart';

class SplashScreen extends GetWidget<SplashScreenViewModel> {
  final scontroller = Get.lazyPut(() => SplashScreenViewModel());
  SplashScreen({Key? key}) : super(key: key);
  DrawerItem dItem = DrawerItems.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Stack(
        children: [
        drawerHolder(),
        screenHolder(),
        ],
      ),
    );
  }

  // Widget drawerHolder -----------
  Widget drawerHolder() => SafeArea(child: MyDrawer(
        onSelectedDrawerItem: (e) {
          dItem = e;
          return controller.closeDrawer();
        },
      ));
  // Widget screenHolder -----------
  Widget screenHolder() {
    return Obx(
      () => AbsorbPointer(
        absorbing: controller.isDrawerOpen!.value,
        child: ClipRRect(
            borderRadius:
                BorderRadius.circular(controller.isDrawerOpen!.value ? 20 : 0),
            child: Screen()),
      ),
    );
  }
}
