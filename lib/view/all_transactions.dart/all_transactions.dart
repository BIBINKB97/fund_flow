// ignore_for_file: non_ant_identifier_names, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fund_flow/utils/common_widgets/nothing_to_show.dart';
import 'package:fund_flow/controller/category_db/category_db.dart';
import 'package:fund_flow/controller/transaction_db/transaction_db.dart';
import 'package:fund_flow/model/category_model/category_model.dart';
import 'package:fund_flow/model/transaction_model/transaction_model.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/utils/common_widgets/gradient_container.dart';
import 'package:fund_flow/view/all_transactions.dart/edit_and_view_details/detailed_view_of_transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  Icon customIcon = Icon(
    Icons.search,
    color: kwhite,
    size: 30,
  );

  Widget customSearchBar = Text(
    "All Transactions",
    style: TextStyle(color: kwhite, fontSize: 24, fontWeight: FontWeight.w600),
  );
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    transactionDB.instance.refreshAll();
    CategoryDB.instance.refreshUI();
    return ValueListenableBuilder(
        valueListenable: transactionDB.instance.transactionListNotifier,
        builder: (BuildContext, List<TransactionModel> newList, Widget_) {
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 236, 238, 238),
            appBar: AppBar(
              centerTitle: true,
              title: customSearchBar,
              toolbarHeight: 70,
              elevation: 1,
              backgroundColor: ktheme,
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      if (customIcon.icon == Icons.search) {
                        customIcon = Icon(
                          Icons.cancel,
                          color: kwhite,
                        );
                        customSearchBar = TextField(
                          onChanged: (value) {
                            transactionDB.instance.search(value);
                          },
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            hintText: 'Search',
                          ),
                          style: TextStyle(
                            color: kwhite,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        );
                      } else {
                        customIcon = Icon(
                          Icons.search,
                          size: 30,
                          color: kwhite,
                        );
                        customSearchBar = Text(
                          "All Transactions",
                          style: TextStyle(
                              color: kwhite,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        );
                      }
                    });
                  },
                  child: SizedBox(
                    width: 100,
                    child: customIcon,
                  ),
                ),
              ],
            ),
            body: GradientContainer(
              height: height * 2.5,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PopupMenuButton(
                      icon: Icon(
                        Icons.filter_alt,
                        color: kwhite,
                        size: 25,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          onTap: () {
                            transactionDB.instance.refreshAll();
                          },
                          child: Text(
                            'All',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        PopupMenuItem(
                            onTap: () {
                              transactionDB.instance.filter('Income');
                            },
                            child: Text('Income',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        PopupMenuItem(
                            onTap: () {
                              transactionDB.instance.filter('Expense');
                            },
                            child: Text('Expense',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    PopupMenuButton(
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: kwhite,
                        size: 25,
                      ),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                            onTap: () {
                              transactionDB.instance.filterDataByDate(
                                'All',
                              );
                            },
                            child: Text('All',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        PopupMenuItem(
                            onTap: () {
                              transactionDB.instance.filterDataByDate(
                                'today',
                              );
                            },
                            child: Text('Today',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        PopupMenuItem(
                            onTap: () {
                              transactionDB.instance.filterDataByDate(
                                'yesterday',
                              );
                            },
                            child: Text(
                              'yesterday',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        PopupMenuItem(
                            onTap: () {
                              transactionDB.instance
                                  .filterDataByDate('last week');
                            },
                            child: Text(
                              'last week',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                      ],
                    )
                  ],
                ),
                Expanded(
                    child: newList.isNotEmpty
                        ? ListView.separated(
                            padding: EdgeInsets.all(10),
                            itemBuilder: (context, index) {
                              final value = newList[index];
                              return Stack(
                                children: [
                                  SlideInUp(
                                    duration: Duration(milliseconds: 400),
                                    child: Slidable(
                                      key: Key(value.id.toString()),
                                      startActionPane: ActionPane(
                                        motion: ScrollMotion(),
                                        children: [
                                          SlidableAction(
                                            backgroundColor: Colors.transparent,
                                            onPressed: (ctx) {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                        'Alert !',
                                                        style: TextStyle(
                                                            color: kred,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      content: Text(
                                                        'Do you want to delete this transaction?',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                              'No',
                                                              style: TextStyle(
                                                                  color: kblue,
                                                                  fontSize: 19,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            )),
                                                        TextButton(
                                                            onPressed: () {
                                                              transactionDB
                                                                  .instance
                                                                  .deleteTransaction(
                                                                      value
                                                                          .id!);
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                              'Yes',
                                                              style: TextStyle(
                                                                  color: kred,
                                                                  fontSize: 19,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ))
                                                      ],
                                                    );
                                                  });
                                            },
                                            icon: Icons.delete,
                                            label: 'Delete',
                                          )
                                        ],
                                      ),
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: ListTile(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        TransactionDetails(
                                                          data: value,
                                                        )));
                                          },
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
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          trailing: Text(
                                            "₹ ${value.amount}",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: value.type ==
                                                      CategoryType.income
                                                  ? kgreen
                                                  : kred,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 2,
                              );
                            },
                            itemCount: newList.length,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              NothingToShow(color: Colors.black54),
                            ],
                          )),
              ]),
            ),
          );
        });
  }

  String parseDate(DateTime date) {
    final formatter = DateFormat('dd EE MMMM');
    return formatter.format(date);
  }
}
