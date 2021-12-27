import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoriesTitle extends StatelessWidget {
  CategoriesTitle({Key? key, this.text, this.press}) : super(key: key);
  String? text;
  Function? press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        Text(
          text!,
          style: const TextStyle(fontSize: 20),
        ),
        const Spacer(),
        MaterialButton(
            color: Colors.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            onPressed: () {
              press!();
            },
            child: const Text("more", style: TextStyle(color: Colors.white)))
      ]),
    );
  }
}
