import 'package:flutter/material.dart';
import 'package:sudaphone/view/categories_pages/moblist.dart';
import 'package:sudaphone/view/widgets/custom_text.dart';


class Realme extends StatelessWidget {

  final List<Map<String, String>> _mobilelist = <Map<String, String>>[
    {
      'image': 'assets/images/product/realme.jpg',
      'name': 'Mate 40 Pro',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '7000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '256GB'
    }
  ];

   Realme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const CustomText(
                text: 'Realme',
                textAlign: TextAlign.center,
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.normal),
            centerTitle: true,
          ),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView.builder(
              itemCount: _mobilelist.length,
              itemBuilder: (context, i) {
                return MobList(
                  imageAtDetails: _mobilelist[i]['image'],
                  battery: _mobilelist[i]['battery'],
                  name: _mobilelist[i]['name'],
                  cpu: _mobilelist[i]['cpu'],
                  camera: _mobilelist[i]['camera'],
                  memory: _mobilelist[i]['memory'],
                  price: _mobilelist[i]['price'],
                );
              },
            ),
          ),
        ));
  }
}