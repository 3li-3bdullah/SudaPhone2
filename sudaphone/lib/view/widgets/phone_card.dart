import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PhoneCard extends StatelessWidget {
   PhoneCard({Key? key,required this.image}) : super(key: key);
  String image;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              Container(
                height: size / 2.5,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
