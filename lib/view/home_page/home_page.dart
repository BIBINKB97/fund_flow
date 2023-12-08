import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fund_flow/controller/transaction_db/transaction_db.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/view/home_page/balance/balance.dart';
import 'package:fund_flow/view/home_page/recent_transactions/recent.dart';
import 'package:fund_flow/view/all_transactions.dart/all_transactions.dart';
import 'package:fund_flow/view/home_page/widgets/inc_exp_cards.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    transactionDB.instance.refreshAll();
    balanceAmount();

    return Scaffold(
      body: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      DateFormat('EEEE d\nMMMM').format(DateTime.now()),
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: kblack,
                      ),
                    ),
                  ),
                  Divider(
                    indent: 30,
                    endIndent: 30,
                    thickness: 1,
                    color: kblack,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Center(
                    child: ValueListenableBuilder(
                      valueListenable: totalNotifier,
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            Text(
                              'Account Balance',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.07,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.020,
                            ),
                            Text(
                              '₹ ${totalNotifier.value.toString()}',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.09,
                                color: kblack,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.045,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SlideInLeft(
                          child: IncomeExpenseCard(
                              containerColor: kgreen,
                              iconColor: kgreen,
                              incomeOrExpense: "Income",
                              icon: Icons.unarchive,
                              amount: '₹${incomeNotifier.value.toString()}'),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.06,
                        ),
                        SlideInRight(
                          child: IncomeExpenseCard(
                              containerColor: kred,
                              iconColor: kred,
                              incomeOrExpense: "Expense",
                              icon: Icons.archive,
                              amount: '₹${expenseNotifier.value.toString()}'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.005,
          ),
          ListTile(
            leading: Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.05,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: TextButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: ktheme,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionList(),
                  ),
                );
              },
              child: Text(
                'View All',
                style: TextStyle(
                  color: ktheme,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Recent(),
        ],
      ),
    );
  }
}
