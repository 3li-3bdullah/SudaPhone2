import 'package:flutter/material.dart';
import 'package:sudaphone/model/drawer_model.dart';
import 'package:sudaphone/view/drawer_widgets/build_drawer_item.dart';

class MyDrawer extends StatelessWidget {
  ValueChanged<DrawerItem> onSelectedDrawerItem;
   MyDrawer({ Key? key , required this.onSelectedDrawerItem }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: SingleChildScrollView(
          child: Column(children: [
        SizedBox(
          width:230,
          child: BuildDrawerItem(onSelectedDrawerItem: onSelectedDrawerItem)),
      ])),
    );
  }
}