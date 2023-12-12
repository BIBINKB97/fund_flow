import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
              fontSize: width * 0.06,
              fontWeight: FontWeight.w600,
              color: kwhite),
        ),
        toolbarHeight: 70,
        elevation: 1,
        backgroundColor: ktheme,
      ),
    );
  }
}
