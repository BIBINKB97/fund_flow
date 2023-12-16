import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final double height;
  const GradientContainer({
    super.key,
    required this.child,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [ktheme, kwhite],
          ),
        ),
        child: child);
  }
}
