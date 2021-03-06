import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/widgets/custom_text.dart';
import 'package:sudaphone/view/widgets/custom_text_form_field.dart';
import 'package:sudaphone/view_model/login_view_model.dart';
import '../../constants.dart';

class BuildFormSignUp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
   BuildFormSignUp({required this.globalSignUpKey});
  final GlobalKey globalSignUpKey;
  LoginViewModel controller = Get.put(LoginViewModel());
  // final GlobalKey<FormState> _formstatesignup = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double mdw = MediaQuery.of(context).size.width;
    return Center(
        child: GetX<LoginViewModel>(
      builder: (controller) => AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutBack,
        margin: EdgeInsets.only(top: controller.showsignin.value ? 40 : 20),
        height: 402,
        width: mdw / 1.2,
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black,
              blurRadius: 0.1,
              spreadRadius: 1,
              offset: Offset(1, 1))
        ]),
        child: Form(
          key: globalSignUpKey,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Start User Name----------
                  const CustomText(
                    text: "إسم المستخدم",
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    onSave: (value) {
                      controller.name = value;
                    },
                    pass: false,
                    validator: (value) {
                      if (value == null) {
                        print('Error');
                      }
                    },
                    icon: Icons.person_outline_rounded,
                    myhinttext: "أدخل اسم المستخدم",
                    fillColor: kfillColor,
                    enabledColor: ksignUpColor1,
                    focusedColor: ksignUpColor2,
                    borderSideColor: ksignUpColor1,
                    prefixColor: Colors.green,
                  ),
                  //End User Name----------
                  //Start User E-mail ----------
                  const SizedBox(height: 10),
                  const CustomText(
                    text: "البريد الالكتروني",
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    onSave: (value) {
                      controller.email = value;
                    },
                    pass: false,
                    validator: (value) {
                      if (value == null) {
                        print('Error');
                      }
                    },
                    icon: Icons.email_outlined,
                    myhinttext: "أدخل عنوان البريد الالكتروني",
                    fillColor: kfillColor,
                    enabledColor: ksignUpColor1,
                    focusedColor: ksignUpColor2,
                    borderSideColor: ksignUpColor1,
                    prefixColor: Colors.green,
                  ),
                  //End User E-mail ----------
                  //Start User Password----------
                  const CustomText(
                    text: "كلمة المرور",
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    onSave: (value) {
                      controller.password = value;
                    },
                    pass: true,
                    validator: (value) {
                      if (value == null) {
                        print('Error');
                      }
                    },
                    icon: Icons.lock_outlined,
                    myhinttext: "أدخل كلمة المرور",
                    fillColor: kfillColor,
                    enabledColor: ksignUpColor1,
                    focusedColor: ksignUpColor2,
                    borderSideColor: ksignUpColor1,
                    prefixColor: Colors.green,
                  ),
                  //Start User Password Confirm----------
                  const CustomText(
                    text: "تأكيد كلمة المرور",
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    onSave: (value) {
                      controller.confirmPassword = value;
                    },
                    pass: true,
                    validator: (value) {
                      if (value != controller.password) {
                        print('كلمة المرور غير متطابقة');
                      }
                    },
                    icon: Icons.lock_outlined,
                    myhinttext: "تأكيد كلمة المرور",
                    fillColor: kfillColor,
                    enabledColor: ksignUpColor1,
                    focusedColor: ksignUpColor2,
                    borderSideColor: ksignUpColor1,
                    prefixColor: Colors.green,
                  ),
                  //End User Password Confirm----------
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
