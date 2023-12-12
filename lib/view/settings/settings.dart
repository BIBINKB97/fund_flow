import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/view/settings/about_us/about_us.dart';
import 'package:fund_flow/view/settings/privacy_policy/privacy_policy.dart';
import 'package:fund_flow/view/settings/reset_app/reset_app.dart';
import 'package:fund_flow/view/settings/terms_and_conditions/terms_and_conditions.dart';
import 'package:iconly/iconly.dart';

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
                  colors: const [
                    Color.fromARGB(210, 151, 52, 184),
                    Colors.white,
                  ],
                ),
              ),
              child: ListView(
                children: [
                  SafeArea(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.03,
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Container(
                          width: width * 0.84,
                          height: height * 0.5,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Column(
                            children: [
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => PrivacyPolicy(),
                                    ));
                                  },
                                  leading: Icon(
                                    Icons.privacy_tip,
                                    color: Color.fromARGB(210, 151, 52, 184),
                                    size: width * 0.08,
                                  ),
                                  title: Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                        fontSize: width * 0.052,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          TermsAndConditions(),
                                    ));
                                  },
                                  leading: Icon(
                                    IconlyBold.document,
                                    color: Color.fromARGB(210, 151, 52, 184),
                                    size: width * 0.08,
                                  ),
                                  title: Text(
                                    'Terms And Conditions',
                                    style: TextStyle(
                                        fontSize: width * 0.052,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20,
                                ),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => AboutUs(),
                                    ));
                                  },
                                  leading: Icon(
                                    Icons.android_rounded,
                                    color: Color.fromARGB(210, 151, 52, 184),
                                    size: width * 0.08,
                                  ),
                                  title: Text(
                                    'About',
                                    style: TextStyle(
                                        fontSize: width * 0.052,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => ResetApp(),
                                    ));
                                  },
                                  leading: Icon(
                                    Icons.restore,
                                    color: Color.fromARGB(210, 151, 52, 184),
                                    size: width * 0.08,
                                  ),
                                  title: Text(
                                    'Reset App',
                                    style: TextStyle(
                                        fontSize: width * 0.052,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
