import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  bool showsignin = true;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String email, password, name;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
