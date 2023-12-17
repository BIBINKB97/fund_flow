import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fund_flow/controller/chart_db/chart_db.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/view/home_page/bottom_navbar/bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Splash2State createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  void initState() {
    super.initState();

    filterFunction();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNav()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double avatarSize = screenHeight * 0.3;
    final double appNameFontSize = screenWidth * 0.10;
    final double linearProgressWidth = screenWidth * 0.3;

    return Scaffold(
      backgroundColor: kblack,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: avatarSize,
              ),
              CircleAvatar(
                backgroundColor: kwhite,
                radius: avatarSize / 3,
                backgroundImage: AssetImage("images/app_icon.png"),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Center(
                child: Text(
                  "Fund Flow",
                  style: GoogleFonts.exo(
                    fontSize: appNameFontSize,
                    fontWeight: FontWeight.w800,
                    color: kwhite,
                  ),
                ),
              ),
              SizedBox(
                width: linearProgressWidth,
                child: LinearProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
