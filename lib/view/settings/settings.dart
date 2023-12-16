import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/view/settings/about_us/about_us.dart';
import 'package:fund_flow/view/settings/privacy_policy/privacy_policy.dart';
import 'package:fund_flow/view/settings/reset_app/reset_app.dart';
import 'package:fund_flow/view/settings/terms_and_conditions/terms_and_conditions.dart';
import 'package:fund_flow/view/settings/widgets/custom_list_tile.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: const [ktheme, kwhite],
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    CustomListSettings(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PrivacyPolicy(),
                              ));
                        },
                        text: 'Privacy Policy',
                        icon: Icons.privacy_tip_rounded),
                    CustomListSettings(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TermsAndConditions(),
                              ));
                        },
                        text: 'Trems And Conditions',
                        icon: Icons.description_rounded),
                    CustomListSettings(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutUs(),
                              ));
                        },
                        text: 'About Us',
                        icon: Icons.android),
                    CustomListSettings(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResetApp(),
                              ));
                        },
                        text: 'Reset App',
                        icon: Icons.restart_alt),
                    SizedBox(
                      height: 100,
                    ),
                    Text('version 1.0.0')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
