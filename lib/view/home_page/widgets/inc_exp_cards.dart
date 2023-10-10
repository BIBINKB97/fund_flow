import 'package:flutter/material.dart';

class IncomeExpenseCard extends StatelessWidget {
  final Color containerColor;
  final Color iconColor;
  final String incomeOrExpense;
  final IconData icon;
  final String amount;
  const IncomeExpenseCard({
    super.key,
    required this.containerColor,
    required this.iconColor,
    required this.incomeOrExpense,
    required this.icon,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.029,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.12,
            height: MediaQuery.of(context).size.height * 0.056,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white,
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: MediaQuery.of(context).size.width * 0.09,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  incomeOrExpense,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.23,
                  height: MediaQuery.of(context).size.height * 0.025,
                  child: Text(
                    amount,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
