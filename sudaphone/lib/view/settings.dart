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
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                  ListTile(
                      title: Text("الوضع الليلي"),
                      trailing: Icon(Icons.wb_sunny),
                      onTap: () {})
                ]))));
  }
}
