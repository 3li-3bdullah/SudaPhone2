import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudaphone/view_model/screen_view_model.dart';

class BottomNavigation extends GetWidget<ScreenViewModel> {
  const BottomNavigation({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(()=>
               BottomNavyBar(
                  selectedIndex: controller.activeIndex.value,
                  showElevation: true,
                  onItemSelected: (index) {
                   controller.activeIndex.value = index;
                  },
                  items: [
                    BottomNavyBarItem(
                        icon: const Icon(Icons.apps),
                        title: const Text("Home"),
                        activeColor: Colors.red),
                    BottomNavyBarItem(
                        icon: const Icon(Icons.category),
                        title: const Text("Categories"),
                        activeColor: Colors.purpleAccent),
                    BottomNavyBarItem(
                        icon: const Icon(Icons.post_add),
                        title: const Text("Posts"),
                        activeColor: Colors.pink),
                    BottomNavyBarItem(
                        icon: const Icon(Icons.settings),
                        title: const Text("Settings"),
                        activeColor: Colors.blue),
                  ]),
            ),
    );
  }
}