import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/widgets/constants.dart';
import 'package:sudaphone/view/widgets/auth_build_avatar.dart';
import 'package:sudaphone/view/widgets/auth_build_form_signin.dart';
import 'package:sudaphone/view/widgets/auth_build_form_signup.dart';
import 'package:sudaphone/view_model/auth_view_model.dart';
import '../screen.dart';
import '../widgets/custom_social_login.dart';
import '../widgets/build_positioned_bottom.dart';
import '../widgets/build_positioned_top.dart';
import '../widgets/custom_text.dart';

class LogIn extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formstatesignin = GlobalKey<FormState>();
  final GlobalKey<FormState> _formstatesignup = GlobalKey<FormState>();

  signin() {
    _formstatesignin.currentState!.save();
    if (_formstatesignin.currentState!.validate()) {
      controller.signInWithEmailAndPassword();
    }
    Get.defaultDialog(
      title: "تم تسحيل دخولك بنجاح",
      textCancel: "إلغاء",
      textConfirm: "تم",
      buttonColor: Colors.green,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        Get.offAll(const Screen(),
            transition: Transition.zoom,
            duration: const Duration(milliseconds: 500));
      },
      radius: 30,
    );
  }

  signup() {
    _formstatesignup.currentState!.save();
    if (_formstatesignup.currentState!.validate()) {
      controller.signUpWithEmailAndPassword();
    }

    Get.defaultDialog(
      title: "تم إنشاء الحساب بنجاح",
      textCancel: "إلغاء",
      textConfirm: "تم",
      buttonColor: Colors.green,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        Get.offAll(const Screen(),
            transition: Transition.zoom,
            duration: const Duration(milliseconds: 500));
      },
      radius: 30,
    );
  }

  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            children: [
              const SizedBox(
                height: double.infinity,
                width: double.infinity,
              ),
              BuildPositionedTop(mdw: mdw, showsignin: controller.showsignin),
              BuildPositionedBottom(
                  mdw: mdw, showsignin: controller.showsignin),
              SizedBox(
                height: 1150,
                child: SingleChildScrollView(
                    child: Column(children: [
                  Center(
                      child: Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Text(
                              controller.showsignin
                                  ? "تسجيل الدخول"
                                  : "إنشاء حساب",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 20)))),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  const BuildAvatar(),
                  controller.showsignin
                      ? BuildFormSignIn(globalSignInKey: _formstatesignin)
                      : BuildFormSignUp(signUpKey: _formstatesignup),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        controller.showsignin
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
                        SizedBox(height: controller.showsignin ? 20 : 5),
                        Material(
                            elevation: 10,
                            color: controller.showsignin
                                ? kprimaryColor
                                : Colors.green,
                            child: MaterialButton(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                onPressed:
                                    controller.showsignin ? signin : signup,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        controller.showsignin
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
                                controller.showsignin = !controller.showsignin;
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
                                        text: controller.showsignin
                                            ? "إنشاء حساب جديد"
                                            : "تسجيل دخول",
                                        style: TextStyle(
                                            color: controller.showsignin
                                                ? Colors.blue
                                                : Colors.purple,
                                            fontWeight: FontWeight.w700)),
                                  ])),
                            )),
                        const SizedBox(height: 10),
                        controller.showsignin
                            ? Directionality(
                                textDirection: TextDirection.ltr,
                                child: Row(children: const [
                                  Expanded(
                                    child: Center(
                                        child: SocialLogin(
                                            imageSocial:
                                                "example/images/social/facebook.png",
                                            text: "Login with Facebook")),
                                  ),
                                  SizedBox(width: 10),
                                  // Padding(
                                  //     padding: EdgeInsets.only(right: 10)),
                                  Expanded(
                                    child: Center(
                                        child: SocialLogin(
                                            imageSocial:
                                                "example/images/social/google.png",
                                            text: "Login with Google")),
                                  ),
                                  // Padding(
                                  //     padding: EdgeInsets.only(right: 10)),
                                ]),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  )
                ])),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}
