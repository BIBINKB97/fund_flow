import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  const GradientContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
        height: height * 0.28,
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
