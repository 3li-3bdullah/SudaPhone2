import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sudaphone/core/view_model/auth_view_model.dart';
import 'package:sudaphone/view/widgets/constants.dart';
import '../screen.dart';
import '../widgets/custom_text_form_field.dart';
import '../widgets/custom_social_login.dart';
import '../widgets/build_positioned_bottom.dart';
import '../widgets/build_positioned_top.dart';
import '../widgets/custom_text.dart';

// class LogIn extends StatefulWidget {

//   @override
//   State<StatefulWidget> createState() {
//     return LogInState();
//   }
// }

showdialogall(context, String mycontent) {
  var mdw = MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (context) {
        return Container(
          height: 100,
          width: mdw / 1.2,
          child: AlertDialog(
            // title: Text(mytitle),
            content: Text(mycontent, style: TextStyle(color: Colors.black)),
            actions: [
              TextButton(
                child: const Text("تم", style: TextStyle(color: Colors.lightGreen)),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return Screen();
                  }));
                },
              ),
            ],
          ),
        );
      });
}

class LogIn extends AuthViewModel {
  GlobalKey<FormState> formstatesignin = GlobalKey<FormState>();
  GlobalKey<FormState> formstatesignup = GlobalKey<FormState>();

  signin() {
    showdialogall(context, "تم تسجيل دخولك بنجاح");
  }

  signup() {
    showdialogall(context, "تم إنشاء الحساب بنجاح");
  }
  //bool showsignin = true;

  // @override
  // void dispose() {
  //   // setState(() {
  //   //   // showsignin = !showsignin;
  //   //   print(showsignin);
  //   // });
  //   //getPre();
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
              ),
              BuildPositionedTop(mdw: mdw, showsignin: showsignin),
              BuildPositionedBottom(mdw: mdw, showsignin: showsignin),
              
                  Container(
                    height: 1150,
                    child: SingleChildScrollView(
                        child: Column(children: [
                      Center(
                          child: Container(
                              margin: EdgeInsets.only(top: 30),
                              child: Text(
                                  showsignin ? "تسجيل الدخول" : "إنشاء حساب",
                                  style:const TextStyle(
                                      color: Colors.white, fontSize: 20)))),
                    const  Padding(padding: EdgeInsets.only(top: 20)),
                      buildContainerAvatar(mdw),
                      showsignin
                          ? buildFormBoxSignIn(mdw)
                          : buildFormBoxSignUp(mdw),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            showsignin
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
                                :const SizedBox(),
                            SizedBox(height: showsignin ? 20 : 5),
                            Material(
                                elevation: 10,
                                color: showsignin ? kprimaryColor : Colors.green.shade900,
                                child: MaterialButton(
                                    padding:const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    onPressed: showsignin ? signin : signup,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            showsignin
                                                ? "تسجيل الدخول"
                                                : "إنشاء حساب",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          Container(
                                              margin:const EdgeInsets.only(top: 4),
                                              padding:const EdgeInsets.only(right: 10),
                                              child:const Icon(Icons.arrow_forward,
                                                  color: Colors.white))
                                        ]))),

                            /// isLoading ? CircularProgressIndicator() : Padding(padding: EdgeInsets.all(0),),
                            Container(
                                margin:const EdgeInsets.only(top: 10),
                                child: InkWell(
                                  
                                  onTap: () {
                                 
                                      showsignin = !showsignin;
                                   
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
                                            text: showsignin
                                                ? "إنشاء حساب جديد"
                                                : "تسجيل دخول",
                                            style: TextStyle(
                                                color: showsignin
                                                    ? Colors.blue
                                                    : Colors.purple,
                                                fontWeight: FontWeight.w700)),
                                      ])),
                                )),
                            const SizedBox(height: 10),
                            showsignin
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

  Center buildFormBoxSignIn(double mdw) {
    return Center(
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
              key: formstatesignin,
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
                          onSave: (value) {},
                          pass: false,
                          validator: (value) {},
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
                        onSave: (vlaue) {},
                        pass: true,
                        validator: (value) {},
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

  Center buildFormBoxSignUp(double mdw) {
    return Center(
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOutBack,
            margin: EdgeInsets.only(top: showsignin ? 40 : 20),
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
              key: formstatesignup,
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
                    const  SizedBox(height: 10),
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
                    const  CustomText(
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
                    const  SizedBox(height: 10),
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

  AnimatedContainer buildContainerAvatar(double mdw) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          color: showsignin ? Colors.blue : kprimaryColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow:const [
            BoxShadow(color: Colors.black, blurRadius: 3, spreadRadius: 0.1)
          ]),
      child: InkWell(
        onTap: () {
          
            showsignin = !showsignin;
         
        },
        child: Stack(
          children: const[
            Positioned(
              top: 25,
              right: 25,
              child: Icon(
                Icons.person_outline,
                size: 50,
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 35,
              left: 60,
              child: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
