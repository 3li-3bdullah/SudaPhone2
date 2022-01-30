import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/binding/binding.dart';
import 'package:sudaphone/view/mydrawer.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SudaPhone SD",
      theme: ThemeData(primaryColor: Colors.white),
      initialBinding: Binding(),
      home: const MyDrawer(),
    );
  }
}
