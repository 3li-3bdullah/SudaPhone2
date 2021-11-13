import 'package:flutter/material.dart';
import 'package:sudaphone/view/moblist.dart';
class Samsung extends StatefulWidget {
  const Samsung({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SamsungState();
}

class _SamsungState extends State<Samsung> {
  var mobilelist = [
    {
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    },
    {
      'name': 'S20 Ultra',
      'camera': '108 Megapixel',
      'cpu': 'Snapdragon 865 ثماني',
      'battery': '5000mha شحن سريع w15',
      'price': '1200\$',
      'memory': '128GB'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text("Samsung"),
            centerTitle: true,
          ),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView.builder(
              itemCount: mobilelist.length,
              itemBuilder: (context, i) {
                return MobList(battery: mobilelist[i]['battery'],
                name: mobilelist[i]['name'],cpu: mobilelist[i]['cpu'],
                camera: mobilelist[i]['camera'],memory: mobilelist[i]['memory'],
                price: mobilelist[i]['price'],);
              },
            ),
          ),
        ));
  }
}

