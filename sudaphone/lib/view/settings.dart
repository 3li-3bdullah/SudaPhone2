import 'package:flutter/material.dart';
import 'package:sudaphone/view/widgets/custom_text.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CustomText(
              text: 'الإعدادات',
              textAlign: TextAlign.center,
              color: Colors.blue,
              fontSize: 25,
              fontWeight: FontWeight.normal)),
    );
  }
}
