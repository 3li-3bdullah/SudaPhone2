import 'package:flutter/material.dart';

class BuildPositionedTop extends StatelessWidget {
  const BuildPositionedTop({
    required this.mdw,
    required this.showsignin,
  });

  final double mdw;
  final bool showsignin;

  @override
  Widget build(BuildContext context) {
    const topColor = Color(0xff78a3eb);
    return Positioned(
        child: Transform.scale(
      scale: 1.3,
      child: Transform.translate(
        offset: Offset(0, -mdw / 1.7),
        /// the offset takes two value horizontal and vertical,
        ///  horizontal will push it right with positive number and left with
        /// naigtive number, and vertical will go down with positive number and the oppsite right.
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: mdw,
          width: mdw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(mdw),
              color: showsignin ? Colors.indigo.shade900 : topColor),
        ),
      ),
    ));
  }
}
