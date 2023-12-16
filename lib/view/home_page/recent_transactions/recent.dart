import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fund_flow/controller/transaction_db/transaction_db.dart';
import 'package:fund_flow/model/category_model/category_model.dart';
import 'package:fund_flow/model/transaction_model/transaction_model.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/utils/common_widgets/nothing_to_show.dart';
import 'package:fund_flow/view/all_transactions.dart/edit_and_view_details/detailed_view_of_transaction.dart';
import 'package:intl/intl.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: transactionDB.instance.transactionListNotifier,
      builder:
          (BuildContext context, List<TransactionModel> newList, Widget? _) {
        return Expanded(
          child: newList.isNotEmpty
              ? ListView.separated(
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index) {
                    final value = newList[index];
                    return SlideInUp(
                      duration: Duration(milliseconds: 300),
                      child: Card(
                        elevation: 0,
                        color: Color.fromARGB(252, 230, 230, 230),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TransactionDetails(
                                      data: value,
                                    )));
                          },
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: value.type == CategoryType.income
                                ? kgreen
                                : kred,
                            child: value.type == CategoryType.income
                                ? Icon(
                                    Icons.arrow_upward,
                                    size: 23,
                                    color: kwhite,
                                  )
                                : Icon(
                                    Icons.arrow_downward,
                                    size: 23,
                                    color: kwhite,
                                  ),
                          ),
                          title: Text(
                            value.category.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            parseDate(value.date),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          trailing: Text(
                            "₹ ${value.amount}",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: value.type == CategoryType.income
                                  ? kgreen
                                  : kred,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox();
                  },
                  itemCount: newList.length > 4 ? 4 : newList.length,
                )
              : NothingToShow(
                  color: kgrey,
                ),
        );
      },
    );
  }

  String parseDate(DateTime date) {
    final date1 = DateFormat.MMMMEEEEd().format(date);
    final splitedDate = date1.split(' ');
    return "${splitedDate.last} ${splitedDate.first}";
  }
}
