import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/core/view_model/auth_view_model.dart';
import 'package:sudaphone/view/auth/login.dart';
import 'package:sudaphone/view/mydrawer.dart';
import 'package:sudaphone/view/widgets/constants.dart';
import 'package:sudaphone/view/widgets/custom_text.dart';
import 'package:sudaphone/view/widgets/custom_text_form_field.dart';

class ControlView extends GetWidget<AuthViewModel> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null) ? MyDrawer() : LogIn();
    });
  }
}

class BuildFormBoxSignUpState extends GetWidget<AuthViewModel> {
  BuildFormBoxSignUpState({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formstatesignup = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    final double mdw = MediaQuery.of(context).size.width;
    return Center(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOutBack,
            margin: EdgeInsets.only(top: controller.showsignin ? 40 : 20),
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
              key: _formstatesignup,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Start User Name----------
                      const CustomText(
                        text: "إسم المستخدم",
                        color: kprimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        onSave: (vlaue) {},
                        pass: false,
                        validator: (value) {},
                        icon: Icons.person_outline_rounded,
                        myhinttext: "أدخل اسم المستخدم",
                        fillColor: kfillColor,
                        enabledColor: Colors.green.shade900,
                        focusedColor: kprimaryColor,
                        borderSideColor: Colors.green.shade900,
                        prefixColor: Colors.green.shade900,
                      ),
                      //End User Name----------
                      //Start User E-mail ----------
                      const SizedBox(height: 10),
                      const CustomText(
                        text: "البريد الالكتروني",
                        color: kprimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        onSave: (vlaue) {},
                        pass: false,
                        validator: (value) {},
                        icon: Icons.email_outlined,
                        myhinttext: "أدخل عنوان البريد الالكتروني",
                        fillColor: kfillColor,
                        enabledColor: Colors.green.shade900,
                        focusedColor: kprimaryColor,
                        borderSideColor: Colors.green.shade900,
                        prefixColor: Colors.green.shade900,
                      ),
                      //End User E-mail ----------
                      //Start User Password----------
                      const CustomText(
                        text: "كلمة المرور",
                        color: kprimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        onSave: (vlaue) {},
                        pass: true,
                        validator: (value) {},
                        icon: Icons.lock_outlined,
                        myhinttext: "أدخل كلمة المرور",
                        fillColor: kfillColor,
                        enabledColor: Colors.green.shade900,
                        focusedColor: kprimaryColor,
                        borderSideColor: Colors.green.shade900,
                        prefixColor: Colors.green.shade900,
                      ),
                      //Start User Password Confirm----------
                      const CustomText(
                        text: "تأكيد كلمة المرور",
                        color: kprimaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        onSave: (vlaue) {},
                        pass: true,
                        validator: (value) {},
                        icon: Icons.lock_outlined,
                        myhinttext: "تأكيد كلمة المرور",
                        fillColor: kfillColor,
                        enabledColor: Colors.green.shade900,
                        focusedColor: kprimaryColor,
                        borderSideColor: Colors.green.shade900,
                        prefixColor: Colors.green.shade900,
                      ),
                      //End User Password Confirm----------
                    ],
                  ),
                ),
              ),
            )));
  }
}
