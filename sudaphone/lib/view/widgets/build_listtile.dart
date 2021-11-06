import 'package:flutter/material.dart';

class BuildListTile extends StatelessWidget {
   BuildListTile(
      {
     required this.text,
     required this.onTap,
     required this.icon,
     required this.textColor,
     required this.iconColor});
  final String text;
  final Function onTap;
  final IconData icon;
   Color textColor = Colors.white;
   Color iconColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text(text,
            style:  TextStyle(color: textColor, fontSize: 18)),
        leading: Icon(icon, color: iconColor, size: 25),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
