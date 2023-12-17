// ignore_for_file: unused_field, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/view/splash_screens/splash2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash1 extends StatefulWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  _Splash1State createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  bool _hasSeenSplash = false;

  @override
  void initState() {
    super.initState();
    _checkIfSeenSplash();
  }

  void _checkIfSeenSplash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenSplash = prefs.getBool('hasSeenSplash') ?? false;
    setState(() {
      _hasSeenSplash = hasSeenSplash;
    });
  }

  void _setHasSeenSplash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenSplash', true);
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double appNameFontSize = screenWidth * 0.13;
    final double imageContainerHeight = screenHeight * 0.35;
    final double imageContainerWidth = screenWidth * 0.8;
    final double headingFontSize = screenHeight * 0.03;
    final double buttonHeight = screenHeight * 0.05;
    final double buttonFontSize = screenHeight * 0.025;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 110, horizontal: 10),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Fund Flow",
                  style: GoogleFonts.exo(
                    fontSize: appNameFontSize,
                    fontWeight: FontWeight.w700,
                    color: ktheme,
                  ),
                ),
              ),
              Container(
                height: imageContainerHeight,
                width: imageContainerWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/1st.png"),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, left: screenWidth * 0.08),
                child: RichText(
                  text: TextSpan(
                    text: "Let's\nManage",
                    style: TextStyle(
                      fontSize: headingFontSize,
                      color: kblack,
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\nMoney',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.048,
                          color: ktheme,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      TextSpan(
                        text: " With Us !",
                        style: TextStyle(
                          fontSize: headingFontSize,
                          color: kblack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              MaterialButton(
                height: buttonHeight,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                color: ktheme,
                onPressed: () async {
                  _setHasSeenSplash();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Splash2()),
                  );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: buttonFontSize,
                    fontWeight: FontWeight.w500,
                    color: kwhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
