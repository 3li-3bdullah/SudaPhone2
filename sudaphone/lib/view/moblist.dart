import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/mobiledetails.dart';

class MobList extends StatelessWidget {
  final name;
  final camera;
  final cpu;
  final battery;
  final price;
  final memory;
  MobList(
      {this.battery,
      this.camera,
      this.cpu,
      this.memory,
      this.name,
      this.price});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:10),
      child: InkWell(
        child: Container(
          height: 180,
          width: 100,
          child: Card(
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Image.asset("example/images/product/samsung.jpg")),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.topRight,
                      height: 180,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 10, right: 10),
                            child: Text(name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w800),
                                textAlign: TextAlign.center),
                          ),
                          Row(children: [
                          const  Text("الكاميرا:",
                                style: TextStyle(color: Colors.grey)),
                            Text(camera, style: TextStyle(color: Colors.blue)),
                          ]),
                          Row(children: [
                          const  Text("المعالج : ",
                                style: TextStyle(color: Colors.grey)),
                            Text(cpu, style: TextStyle(color: Colors.blue))
                          ]),
                          Row(children: [
                          const  Text("الذاكرة:",
                                style: TextStyle(color: Colors.grey)),
                            Text(memory, style: TextStyle(color: Colors.blue)),
                          ]),
                          Row(children:  [
                           const Text("البطارية :",
                                style: TextStyle(color: Colors.grey)),
                            Text(battery, style: TextStyle(color: Colors.blue))
                          ]),
                          Row(
                            children: [
                              Expanded(
                                child: Row(children:  [
                                  Text("السعر : $price",
                                      style: const TextStyle(color: Colors.red)),
                                ]),
                              ),
                              Row(children: const [
                                Text("للمزيد إضغط هنا",
                                    style: TextStyle(color: Colors.green)),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
        onTap: () {
          Get.to(const MobileDetails());
        },
      ),
    );
  }
}
