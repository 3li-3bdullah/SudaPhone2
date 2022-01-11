import 'package:get/get.dart';
import 'package:sudaphone/view_model/login_view_model.dart';
import 'package:sudaphone/view_model/screen_view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginViewModel() , fenix: true);
    Get.lazyPut(() => ScreenViewModel() , fenix: true);
  }
}
