import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenu extends StatelessWidget {
  final VoidCallback? onClicked;   
  const DrawerMenu({Key? key, this.onClicked}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const FaIcon(FontAwesomeIcons.alignLeft),
      onPressed:onClicked);
  }
}
