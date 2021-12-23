import 'package:flutter/material.dart';
import 'package:sudaphone/view/my_drawer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Stack(
        drawerHolder(),
      ),
    );
  }
  // Widget drawerHolder -----------
  Widget drawerHolder()=>SafeArea(child: MyDrawer(onSelectedDrawerItem: (e) { 

   },
       
      ));
  

}