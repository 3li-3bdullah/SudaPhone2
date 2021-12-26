import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
                 'الإعدادات',),
            centerTitle: true,
          ),
          body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: ListTile(
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
              ))),
    );
  }
}
