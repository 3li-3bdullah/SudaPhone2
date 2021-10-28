import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/auth/login.dart';


void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SudaPhone",
     // theme: ThemeData(fontFamily: 'Cairo'),
      home: LogIn(),
    );
  }
}