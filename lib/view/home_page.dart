import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/utils/constants.dart';
import 'package:fund_flow/view/widgets/inc_exp_cards.dart';
import 'package:fund_flow/view/widgets/recent_transactions_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        decoration: BoxDecoration(
          color: klight3,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'date',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(
              indent: 30,
              endIndent: 30,
              thickness: 1.5,
              color: Colors.black,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.025,
            ),
            Center(
                child: Column(
              children: [
                Text(
                  'Account Balance',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.020,
                ),
                Text(
                  '₹ 0',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IncomeExpenseCard(
                    containerColor: kgreen,
                    icon: Icons.unarchive,
                    iconColor: kgreen,
                    incomeOrExpense: 'income',
                    amount: '₹ 250',
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.06,
                  ),
                  IncomeExpenseCard(
                    containerColor: kred,
                    iconColor: kred,
                    incomeOrExpense: 'expense',
                    icon: Icons.archive,
                    amount: '₹ 350',
                  )
                ],
              ),
            ),
            kheight20,
            RecentTracnsactionsTile(),
          ],
        ),
      ))
    ]));
  }
}
