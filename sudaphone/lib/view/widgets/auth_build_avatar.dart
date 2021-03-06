import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view_model/login_view_model.dart';

import '../../constants.dart';

class BuildAvatar extends GetWidget<LoginViewModel> {
   BuildAvatar({Key? key}) : super(key: key);
  LoginViewModel xcontroller = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
              color:
                  controller.showsignin.value ? ksignInColor1 : ksignUpColor2,
              borderRadius: BorderRadius.circular(100),
              boxShadow: const [
                BoxShadow(color: Colors.black, blurRadius: 3, spreadRadius: 0.1)
              ]),
          child: InkWell(
            onTap: () {
              controller.showsignin(false);
            },
            child: Stack(
              children: const [
                Positioned(
                  top: 25,
                  right: 25,
                  child: Icon(
                    Icons.person_outline,
                    size: 50,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  top: 35,
                  left: 60,
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
