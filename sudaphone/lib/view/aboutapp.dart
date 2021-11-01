import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/widgets/custom_text.dart';
// import '../compount/mydrawer.dart';

class AboutApp extends StatefulWidget {
  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: const CustomText(
                  text: "حول التطبيق",
                  textAlign: TextAlign.center,
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.normal),
              centerTitle: true,
            ),

            ///drawer: MyDrawer(),
            body: ListView(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(10),
                  child: RichText(
                      text: const TextSpan(
                    style: TextStyle(fontSize: 15),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "بعرض لك هذا التطبيق معظم انواع التلفوات وسعرها بالجنية السوداني",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                      TextSpan(
                          text:
                              "إذا واجهتك أي مشكلة يمكنك مراسلتي عبر البريد التالي : ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black)),
                      TextSpan(
                          text: "Alieko.A50@gmail.com",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.green)),
                    ],
                  )),
                ),
                const Padding(padding: EdgeInsets.all(50)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextButton(
                    onPressed: () {
                      Get.snackbar("Ali Abdullah",
                          "Programmer he wanted to work just freelancer :) ");
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.green ,
                         Colors.red]),
                      ),
                      child: const CustomText(text: "حول مطور التطبيق",
                       textAlign: TextAlign.center, color: Colors.white,
                        fontSize: 20, fontWeight: FontWeight.w600),
                    )
                  ),
                )
              ],
            )));
  }
}