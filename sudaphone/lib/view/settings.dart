import 'package:flutter/material.dart';
import 'package:sudaphone/view/widgets/custom_text.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
    textDirection:TextDirection.ltr,
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                    ListTile(
                        title: const Text("الوضع الليلي"),
                        trailing: const Icon(Icons.wb_sunny),
                        onTap: (){},
                        )
                  ])))),
    );
  }
}
