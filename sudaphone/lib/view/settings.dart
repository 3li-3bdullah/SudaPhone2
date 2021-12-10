import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/widgets/custom_text.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const CustomText(
                text: 'الإعدادات',
                textAlign: TextAlign.center,
                fontSize: 25,
                fontWeight: FontWeight.normal),
            centerTitle: true,
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          title: const Text("الوضع فاتح / داكن"),
                          trailing: const Icon(Icons.wb_sunny),
                          onTap: () {
                            Get.bottomSheet(Wrap(
                              children: [
                                ListTile(
                                  title: const Text("الوضع الفاتح"),
                                  leading: const Icon(Icons.wb_sunny_outlined),
                                  onTap: () {
                                    Get.changeTheme(ThemeData.light());
                                  },
                                ),
                                ListTile(
                                  title: const Text("الوضع الداكن"),
                                  leading: const Icon(Icons.wb_sunny),
                                  onTap: () {
                                    Get.changeTheme(ThemeData.dark());
                                  },
                                ),
                              ],
                            ));
                          },
                        ),
                      ],
                    )
                  ]))),
    );
  }
}
