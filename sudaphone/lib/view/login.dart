import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/mydrawer.dart';
import 'package:sudaphone/view/widgets/auth_build_avatar.dart';
import 'package:sudaphone/view/widgets/auth_build_form_signin.dart';
import 'package:sudaphone/view/widgets/auth_build_form_signup.dart';
import 'package:sudaphone/view_model/login_view_model.dart';
import '../constants.dart';
import 'widgets/build_positioned_bottom.dart';
import 'widgets/build_positioned_top.dart';
import 'widgets/custom_text.dart';

class LogIn extends GetWidget<LoginViewModel> {
  final GlobalKey<FormState> _signInKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Obx(
          () => Stack(
            children: [
              const SizedBox(
                height: double.infinity,
                width: double.infinity,
              ),
              BuildPositionedTop(
                  mdw: mdw, showsignin: controller.showsignin.value),
              BuildPositionedBottom(
                  mdw: mdw, showsignin: controller.showsignin.value),
              SizedBox(
                height: 1150,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Center(
                      child: Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Text(
                              controller.showsignin.value
                                  ? "تسجيل الدخول"
                                  : "إنشاء حساب",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20)))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  BuildAvatar(),
                  controller.showsignin.value
                      ? BuildFormSignIn(globalSignInKey: _signInKey)
                      : BuildFormSignUp(globalSignUpKey: _signUpKey),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        controller.showsignin.value
                            ? InkWell(
                                onTap: () {},
                                child: const CustomText(
                                  text: "هل نسيت كلمة المرور ؟",
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : const SizedBox(),
                        SizedBox(height: controller.showsignin.value ? 20 : 5),
                        Material(
                            elevation: 10,
                            color: controller.showsignin.value
                                ? Colors.indigo.shade900
                                : ksignInColor1,
                            child: MaterialButton(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                onPressed: controller.showsignin.value
                                    ? controller.signin(_signInKey)
                                    : controller.signup(_signUpKey),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        controller.showsignin.value
                                            ? "تسجيل الدخول"
                                            : "إنشاء حساب",
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.only(top: 4),
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: const Icon(Icons.arrow_forward,
                                              color: Colors.white))
                                    ]))),

                        /// isLoading ? CircularProgressIndicator() : Padding(padding: EdgeInsets.all(0),),
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: InkWell(
                              onTap: () {
                                controller.changVal();
                              },
                              child: RichText(
                                  text: TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      children: <TextSpan>[
                                    TextSpan(
                                        //recognizer: _changesign,
                                        text: controller.showsignin.value
                                            ? "إنشاء حساب جديد"
                                            : "تسجيل دخول",
                                        style: TextStyle(
                                            color: controller.showsignin.value
                                                ? Colors.green
                                                : Colors.pinkAccent,
                                            fontWeight: FontWeight.w700)),
                                  ])),
                            )),
                      ],
                    ),
                  )
                ])),
              ),
              const SizedBox(height: 20),
            ],
          ),
        )));
  }
}
