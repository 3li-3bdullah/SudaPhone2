

import 'package:get/get.dart';

class SplashScreenViewModel extends GetxController{

  
  RxDouble? xOffset = 0.0.obs;
  RxDouble? yOffset = 0.0.obs;
  RxDouble? scaleFactor = 1.0.obs;
  RxBool? isDrawerOpen = false.obs;

  openDrawer() {
    xOffset!.value = 230.0;
    yOffset!.value = 150.0;
    scaleFactor!.value = 0.6;
    isDrawerOpen!.value = true;
  }

  void closeDrawer() {
    xOffset!.value = 0.0;
    yOffset!.value = 0.0;
    scaleFactor!.value = 1.0;
    isDrawerOpen!.value = false;
  }
}