import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/widgets/custom_text.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          appBar: AppBar(
            title: const CustomText(
                text: 'الإعدادات',
                textAlign: TextAlign.center,
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.normal),
            centerTitle: true,
            backgroundColor: Colors.white,
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: const Text("الوضع فاتح / داكن"),
                      onTap: () {
                        Get.bottomSheet(Container(
                          child: Wrap(
                            children: [
                              ListTile(
                                title: Text("الوضع الفاتح"),
                                leading: Icon(Icons.wb_sunny_outlined),
                                onTap: () {
                                  Get.changeTheme(ThemeData.light());
                                },
                              ),
                              ListTile(
                                title: Text("الوضع الداكن"),
                                leading: Icon(Icons.wb_sunny),
                                onTap: () {
                                  Get.changeTheme(ThemeData.dark());
                                },
                              ),
                            ],
                          ),
                        ));
                      },
                    )
                  ]))),
    );
  }
}
