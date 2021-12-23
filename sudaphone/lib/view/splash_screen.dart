import 'package:flutter/material.dart';
import 'package:sudaphone/view/my_drawer.dart';
import 'package:sudaphone/view/screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: Stack(
        drawerHolder(),
        screenHolder(),
      ),
    );
  }

  // Widget drawerHolder -----------
  Widget drawerHolder() => SafeArea(
          child: MyDrawer(
        onSelectedDrawerItem: (e) {},
      ));
  // Widget screenHolder -----------
  Widget screenHolder() {
    return Screen();
  }
}
