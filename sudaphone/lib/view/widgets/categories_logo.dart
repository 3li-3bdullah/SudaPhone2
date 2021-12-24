import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';

class CategoriesLogo extends StatelessWidget {
  const CategoriesLogo({
    required this.imageLogo,
    required this.text,
    required this.onTap,
  });
  final String imageLogo;
  final String text;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        width: 100,
        child: ListTile(
            onTap: () {
              onTap();
            },
            title: Image.asset(imageLogo, fit: BoxFit.cover),
            subtitle: CustomText(
              text: text,
              textAlign: TextAlign.center,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            )));
  }
}
