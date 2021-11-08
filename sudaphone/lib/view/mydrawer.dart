import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/aboutapp.dart';
import 'package:sudaphone/view/auth/login.dart';
import 'package:sudaphone/view/categories.dart';
import 'package:sudaphone/view/post.dart';
import 'package:sudaphone/view/screen.dart';
import 'package:sudaphone/view/settings.dart';
import 'package:sudaphone/view/widgets/build_listtile.dart';
import 'package:sudaphone/view/widgets/custom_text.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.blue.shade400, Colors.blue.shade800],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
          ),
          SafeArea(
              child: Container(
                  width: 200.0,
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    DrawerHeader(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("example/images/slider/ali.jpg"),
                        ),
                        SizedBox(height: 10),
                        CustomText(
                            text: "Ali Abdullah",
                            textAlign: TextAlign.center,
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                        CustomText(
                            text: "Alieko.soul@gamil.com",
                            textAlign: TextAlign.center,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                      ],
                    )),
                    Expanded(
                        child: ListView(children: [
                      BuildListTile(
                        text: 'الصفحة الرئيسية',
                        onTap: () {
                          Get.offAll(const Screen(),
                              transition: Transition.rightToLeftWithFade);
                        },
                        icon: Icons.home_outlined,
                      ),
                      BuildListTile(
                        text: "الأقسام",
                        onTap: () {
                          Get.to(const Categories(),
                              transition: Transition.zoom);
                        },
                        icon: Icons.category_outlined,
                      ),
                      BuildListTile(
                        text: "إضافة منشور",
                        onTap: () {
                          Get.to(Post(),
                              transition: Transition.leftToRightWithFade);
                        },
                        icon: Icons.post_add_outlined,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      BuildListTile(
                        text: "حول التطبيق",
                        onTap: () {
                          Get.to(const AboutApp(),
                              transition: Transition.upToDown);
                        },
                        icon: Icons.info_outline,
                      ),
                      BuildListTile(
                        text: "الإعدادات",
                        onTap: () {
                          Get.to(const Settings(),
                              transition: Transition.downToUp);
                        },
                        icon: Icons.settings_outlined,
                      ),
                      BuildListTile(
                        text: "تسجيل الخروج",
                        onTap: () {
                          Get.defaultDialog(
                            title: "Why :( ,Are you sure dear ?!",
                            middleText: "If you logoff, you will stop receiving our service",
                            titleStyle: TextStyle(color: Colors.black ),
                            textConfirm:"نعم",
                            textCancel: "لا",
                            buttonColor: Colors.purple,
                            confirmTextColor: Colors.white,
                            cancelTextColor: Colors.green,
                            onConfirm:(){},
                            onCancel:(){}
                          );
                        },
                        icon: Icons.exit_to_app_outlined,
                      ),
                    ]))
                  ]))),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
              builder: (_, double val, __) {
                return (Transform(
                  alignment: Alignment.center,
                  transform: (Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3,
                        200 * val) //This will allows us to translate the screen
                    ..rotateY((pi / 6) * val)),
                  child: const Screen(),
                ));
              }),

          ///The GestureDectector will allows to me open the drawer
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },

            //   onTap: () {
            //   ///If the value equal to 0 then when we tap it will become 1
            //   ///else it will become 0
            //   setState(() {
            //     value == 0 ? value = 1 : value = 0;
            //   });
            // }
          )
        ],
      ),
    );
  }
}
