import 'package:flutter/material.dart';
import 'package:sudaphone/model/drawer_model.dart';

class BuildDrawerItem extends StatelessWidget {

   BuildDrawerItem({ Key? key , required this.onSelectedDrawerItem }) : super(key: key);
  ValueChanged<DrawerItem> onSelectedDrawerItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: DrawerItems.all
          .map((e) => ListTile(
              onTap: () => onSelectedDrawerItem(e),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              leading: Icon(e.icon! , color: Colors.white),
              title: Text(
                e.title!,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              )))
          .toList());
  }
}