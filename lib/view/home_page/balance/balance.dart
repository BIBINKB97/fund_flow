import 'package:flutter/material.dart';
import 'package:fund_flow/database/transaction_db/transaction_db.dart';
import 'package:fund_flow/model/category_model/category_model.dart';

ValueNotifier<double> incomeNotifier = ValueNotifier(0);
ValueNotifier<double> expenseNotifier = ValueNotifier(0);
ValueNotifier<double> totalNotifier = ValueNotifier(0);

Future<void> balanceAmount() async {
  await transactionDB.instance.getAllTransactions().then((value) {
    expenseNotifier.value = 0;
    incomeNotifier.value = 0;
    totalNotifier.value = 0;

    for (var item in value) {
      if (item.type == CategoryType.income) {
        incomeNotifier.value += item.amount;
      } else {
        expenseNotifier.value += item.amount;
      }
    }
    totalNotifier.value = incomeNotifier.value - expenseNotifier.value;
  });
}