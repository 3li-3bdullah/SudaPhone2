import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerItem {
  final String? title;
  final IconData? icon;

  DrawerItem({this.title, this.icon});
}

class DrawerItems{
 
 static DrawerItem home = DrawerItem(title: 'Home', icon: FontAwesomeIcons.home);
  static DrawerItem categories = DrawerItem(title: 'Categories', icon: Icons.category);
  static DrawerItem settings = DrawerItem(title: 'Settings', icon: Icons.settings);
  static DrawerItem logOut = DrawerItem(title: 'Log Out', icon: Icons.logout);
  static DrawerItem help = DrawerItem(title: 'Help', icon: Icons.help);
  static DrawerItem info = DrawerItem(title: 'Info', icon: Icons.info);
 

}