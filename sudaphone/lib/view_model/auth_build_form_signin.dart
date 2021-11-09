import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/widgets/custom_text.dart';
import 'package:sudaphone/view/widgets/custom_text_form_field.dart';
import 'package:sudaphone/view_model/auth_view_model.dart';
import '../constants.dart';

class BuildFormSignIn extends GetWidget<AuthViewModel> {
   // ignore: use_key_in_widget_constructors
   const BuildFormSignIn({required this.signInKey});
  //final GlobalKey<FormState> _formstatesignin = GlobalKey<FormState>();
  final GlobalKey signInKey;

  @override
  Widget build(BuildContext context) {
    final double mdw = MediaQuery.of(context).size.width;
    return Center(
      //Here should i added expanded just after i test the last codes.
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutBack,
            margin: const EdgeInsets.only(top: 40),
            height: 250,
            width: mdw / 1.2,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 0.1,
                  spreadRadius: 1,
                  offset: Offset(1, 1))
            ]),
            child: Form(
              key: signInKey,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Start Email----------
                      const CustomText(
                        text: "عنوان البريد الالكتروني",
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 10),
                      CustomTextFormField(
                          onSave: (value) {
                            controller.email = value;
                          },
                          pass: false,
                          validator: (value) {
                            if (value == null) {
                              print("Error");
                            }
                          },
                          icon: Icons.email_outlined,
                          myhinttext: "ادخل البريد الالكتروني هنا",
                          prefixColor: kprimaryColor,
                          fillColor: kfillColor,
                          enabledColor: kprimaryColor,
                          focusedColor: Colors.blue,
                          borderSideColor: kprimaryColor),
                      //End User Name----------
                      //Start User Password----------
                      const CustomText(
                        text: "كلمة المرور",
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        onSave: (value) {
                          controller.password = value;
                        },
                        pass: true,
                        validator: (value) {
                          if (value == null) {
                            print("Error");
                          }
                        },
                        icon: Icons.lock_outline,
                        myhinttext: "أدخل  كلمة المرور هنا",
                        fillColor: kfillColor,
                        enabledColor: kprimaryColor,
                        focusedColor: Colors.blue,
                        borderSideColor: kprimaryColor,
                        prefixColor: kprimaryColor,
                      ),
                      //End User Password----------
                    ],
                  ),
                ),
              ),
            )));
  }
}
