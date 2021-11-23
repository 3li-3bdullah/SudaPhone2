import 'package:get/get.dart';

class MyDrawerViewModel extends GetxController {
  double value = 0;
  void one() {
    value = 1;
    update();
  }

  void zero() {
    value = 0;
    update();
  }
}
