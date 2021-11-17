import 'package:flutter/material.dart';
import 'package:sudaphone/view/moblist.dart';
import 'package:sudaphone/view/widgets/custom_text.dart';

class Samsung extends StatelessWidget {
  List<Map<String, String>> mobilelist = <Map<String,String>>[
    {
      'image':'example/images/product/samsung.jpg',
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'image':'example/images/product/samsung.jpg',
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'image':'example/images/product/samsung.jpg',
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'image':'example/images/product/samsung.jpg',
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'image':'example/images/product/samsung.jpg',
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'image':'example/images/product/samsung.jpg',
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'image':'example/images/product/samsung.jpg',
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'image':'example/images/product/samsung.jpg',
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const CustomText(
                text: 'Samsung',
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
              itemCount: mobilelist.length,
              itemBuilder: (context, i) {
                return MobList(detailsImage: mobilelist[i]['image'],
                  battery: mobilelist[i]['battery'],
                  name: mobilelist[i]['name'],
                  cpu: mobilelist[i]['cpu'],
                  camera: mobilelist[i]['camera'],
                  memory: mobilelist[i]['memory'],
                  price: mobilelist[i]['price'],
                );
              },
            ),
          ),
        ));
  }
}
