import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  const CustomContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: kgrey,
          width: 1.2,
        ),
      ),
      child: child,
    );
  }
}
