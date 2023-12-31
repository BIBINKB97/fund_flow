import 'package:flutter/material.dart';
import 'package:fund_flow/model/category_model/category_model.dart';
import 'package:fund_flow/model/transaction_model/transaction_model.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/view/home_page/balance/balance.dart';
import 'package:fund_flow/view/splash_screens/splash1.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ResetApp extends StatelessWidget {
  const ResetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Reset App',
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                color: kwhite,
                fontWeight: FontWeight.w600),
          ),
          toolbarHeight: 70,
          elevation: 1,
          backgroundColor: ktheme,
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
                  ktheme,
                  kwhite,
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.22,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Lottie.asset('images/reset.json'),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.055),
                Text(
                  'This action cannot be undone and\n     you will lose all of your data.!',
                  style: TextStyle(
                      color: kred,
                      fontSize: MediaQuery.of(context).size.width * 0.06,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(kwhite)),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: kblack,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.w600),
                            ))),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(kwhite)),
                        onPressed: () async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Alert ! ',
                                    style: TextStyle(
                                        color: kred,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.055,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  content: Text(
                                    'Do you want to reset the entire data?',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.052,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'No',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.052,
                                              color: kgreen),
                                        )),
                                    TextButton(
                                        onPressed: () async {
                                          SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                          await prefs.clear();
                                          SharedPreferences textcontrol =
                                              await SharedPreferences
                                                  .getInstance();
                                          await textcontrol.clear();
                                          final transationDb = await Hive
                                              .openBox<TransactionModel>(
                                                  'transactions');
                                          final categorydb =
                                              await Hive.openBox<CategoryModel>(
                                                  'category');

                                          categorydb.clear();
                                          transationDb.clear();

                                          incomeNotifier = ValueNotifier(0);
                                          expenseNotifier = ValueNotifier(0);
                                          totalNotifier = ValueNotifier(0);

                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                            builder: (context) =>
                                                const Splash1(),
                                          ));
                                        },
                                        child: Text(
                                          'Yes',
                                          style: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.052,
                                              color: kred),
                                        ))
                                  ],
                                );
                              });
                        },
                        child: Text(
                          'Reset ',
                          style: TextStyle(
                              color: kblack,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
