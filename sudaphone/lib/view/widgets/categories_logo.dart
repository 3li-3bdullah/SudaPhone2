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
        height: 80,
        width: 80,
        child: ListTile(
            onTap: () {
              onTap();
            },
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(imageLogo), fit: BoxFit.cover)),
            ),
            subtitle: CustomText(
              text: text,
              textAlign: TextAlign.center,
              fontSize: 15,
              fontWeight: FontWeight.normal,
            )));
  }
}
