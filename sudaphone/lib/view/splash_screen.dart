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
      () => WillPopScope(
          onWillPop: () async {
          if (controller.isDrawerOpen!.value) {
            controller.closeDrawer;
            return false;
          } else {
            return true;
          }
        },
        child: GestureDetector(
          onTap: controller.closeDrawer,
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
                transform: Matrix4.translationValues(
                    controller.xOffset!.value, controller.yOffset!.value, 0),
            child: AbsorbPointer(
              absorbing: controller.isDrawerOpen!.value,
              child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(controller.isDrawerOpen!.value ? 20 : 0),
                  child: Screen()),
            ),
          ),
        ),
      ),
    );
  }
}
