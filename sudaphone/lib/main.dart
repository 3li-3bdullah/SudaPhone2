import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view/control_view.dart';


void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SudaPhone",
     // theme: ThemeData(fontFamily: 'Cairo'),
      home: ControlView(),
    );
  }
}