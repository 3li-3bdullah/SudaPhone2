import 'package:flutter/material.dart';
import './constants.dart';

class BuildPositionedBottom extends StatelessWidget {
  const BuildPositionedBottom({
    
    required this.mdw,
    required this.showsignin,
  }) ;

  final double mdw;
  final bool showsignin;

  @override
  Widget build(BuildContext context) {
    Color bottomColor = const Color(0xfffbc2eb);
    return Positioned(
      //top : 300
      top: mdw * 1.1, // this will go down
      right: mdw / 1.5,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: mdw,
        width: mdw,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(mdw),
         color: showsignin ? Colors.blue.withOpacity(.5) : bottomColor),
      ),
    );
  }
}