import 'package:flutter/material.dart';
import 'package:fund_flow/controller/category_db/category_db.dart';
import 'package:fund_flow/model/transaction_model/transaction_model.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/utils/common_widgets/gradient_container.dart';
import 'package:fund_flow/view/all_transactions.dart/edit_and_view_details/edit_transaction.dart';
import 'package:fund_flow/view/all_transactions.dart/edit_and_view_details/widgets/custom_list_tile.dart';
import 'package:intl/intl.dart';

class TransactionDetails extends StatelessWidget {
  final TransactionModel data;

  const TransactionDetails({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Details of Transaction',
          style: TextStyle(
            fontSize: width * 0.06,
            fontWeight: FontWeight.w600,
            color: kwhite,
          ),
        ),
        toolbarHeight: height * 0.09,
        elevation: 1,
        backgroundColor: ktheme,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GradientContainer(
              height: height * 0.88,
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.09,
                      ),
                      Container(
                        width: width * 0.8,
                        height: width * 1,
                        decoration: BoxDecoration(
                          color: kwhite,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            CustomListTile(
                              title: 'Amount : ',
                              text: data.amount.toString(),
                              icon: Icons.currency_rupee_outlined,
                            ),
                            CustomListTile(
                              title: 'Category : ',
                              text: data.category.name,
                              icon: Icons.category,
                            ),
                            CustomListTile(
                              title: 'Description : ',
                              text: data.description,
                              icon: Icons.description,
                            ),
                            CustomListTile(
                              title: 'Date : ',
                              text: parseDate(data.date),
                              icon: Icons.date_range,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              ktheme,
                            ),
                          ),
                          onPressed: () {
                            CategoryDB.instance.refreshUI();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => EditDetails(
                                  data: data,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Edit Details',
                            style: TextStyle(fontSize: width * 0.05),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String parseDate(DateTime date) {
    final formatter = DateFormat('d EEEE MMMM');
    return formatter.format(date);
  }
}
