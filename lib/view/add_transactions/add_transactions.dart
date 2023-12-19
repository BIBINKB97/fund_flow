import 'package:flutter/material.dart';
import 'package:fund_flow/controller/category_db/category_db.dart';
import 'package:fund_flow/controller/transaction_db/transaction_db.dart';
import 'package:fund_flow/model/category_model/category_model.dart';
import 'package:fund_flow/model/transaction_model/transaction_model.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/utils/common_widgets/gradient_container.dart';
import 'package:fund_flow/view/add_categories/add_categories.dart';
import 'package:fund_flow/view/add_transactions/widgets/custom_container.dart';
import 'package:fund_flow/view/add_transactions/widgets/custom_text_style.dart';
import 'package:fund_flow/view/home_page/bottom_navbar/bottom_nav.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  DateTime? _selectedDate;
  CategoryType? _selectedCategorytype;
  CategoryModel? _selectedCategoryModel;

  String? _categoryID;

  final _amountTextEditingController = TextEditingController();
  final _descriptionTextEditingController = TextEditingController();
  CategoryDB categoryDB = CategoryDB();

  void inistate() {
    _selectedCategorytype = CategoryType.income;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    transactionDB.instance.refreshAll();
    CategoryDB.instance.refreshUI();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Transactions',
          style: TextStyle(
              fontSize: width * 0.06,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        toolbarHeight: 70,
        elevation: 1,
        backgroundColor: ktheme,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          GradientContainer(
            height: height * 0.25,
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: height * 0.06),
                  Center(
                      child: Text(
                    'Enter Amount',
                    style: TextStyle(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.w400,
                        color: kwhite),
                  )),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Center(
                    child: SizedBox(
                      height: height * 0.075,
                      width: width * 0.40,
                      child: TextFormField(
                        controller: _amountTextEditingController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            prefixIcon: Icon(
                              Icons.currency_rupee_rounded,
                              color: ktheme,
                              size: width * 0.065,
                            )),
                        cursorColor: kblack,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: width * 0.065,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedCategorytype = CategoryType.income;
                    _categoryID = null;
                  });
                },
                child: Container(
                  height: height * 0.070,
                  width: width * 0.35,
                  decoration: BoxDecoration(
                      color: kgreen,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Radio(
                          activeColor: kwhite,
                          value: CategoryType.income,
                          groupValue: _selectedCategorytype,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCategorytype = CategoryType.income;
                              _categoryID = null;
                            });
                          }),
                      Text(
                        "Income",
                        style: TextStyle(
                            color: kwhite,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _selectedCategorytype = CategoryType.expense;
                    _categoryID = null;
                  });
                },
                child: Container(
                  height: height * 0.070,
                  width: width * 0.35,
                  decoration: BoxDecoration(
                      color: kred,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Radio(
                          activeColor: kwhite,
                          value: CategoryType.expense,
                          groupValue: _selectedCategorytype,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCategorytype = CategoryType.expense;
                              _categoryID = null;
                            });
                          }),
                      Text(
                        "Expense",
                        style: TextStyle(
                            color: kwhite,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomContainer(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.playlist_add_circle,
                        size: 25,
                        color: ktheme,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AddCategories()));
                          },
                          child: Text(
                            'Add  Category',
                            style: CustomTextStyle().textStyle,
                          )),
                    ],
                  ),
                ),
              ),
              CustomContainer(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButton<String>(
                    underline: Container(),
                    hint: Text(
                      'Select Category',
                      style: CustomTextStyle().textStyle,
                    ),
                    value: _categoryID,
                    items: (_selectedCategorytype == CategoryType.income
                            ? CategoryDB().incomeCategoryListListner
                            : CategoryDB().expenseCategoryListListner)
                        .value
                        .map((e) {
                      return DropdownMenuItem(
                        value: e.id,
                        child: Text(
                          e.name,
                          style: CustomTextStyle().textStyle,
                        ),
                        onTap: () {
                          _selectedCategoryModel = e;
                        },
                      );
                    }).toList(),
                    onChanged: (selectedValue) {
                      setState(() {
                        _categoryID = selectedValue;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Column(
            children: [
              SizedBox(
                width: width * 0.9,
                child: TextFormField(
                  controller: _descriptionTextEditingController,
                  decoration: InputDecoration(
                    hintText: 'description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  cursorColor: kblack,
                  style: CustomTextStyle().textStyle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: kgrey,
                    width: 1.0,
                  ),
                ),
                child: TextButton.icon(
                    onPressed: () async {
                      final selectedDateTemp = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now().subtract(Duration(days: 30)),
                        lastDate: DateTime.now(),
                      );
                      if (selectedDateTemp == null) {
                        return;
                      } else {
                        setState(() {
                          _selectedDate = selectedDateTemp;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.calendar_month,
                      color: Colors.black54,
                    ),
                    label: Text(
                      _selectedDate == null
                          ? 'pick a date'
                          : DateFormat("dd-MMMM-yyyy").format(_selectedDate!),
                      style: CustomTextStyle().textStyle,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Column(children: [
            MaterialButton(
              height: height * 0.05,
              minWidth: width * 0.4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              color: ktheme,
              onPressed: () {
                addTransaction();
              },
              child: Text(
                'Submit',
                style: TextStyle(
                    fontSize: width * 0.045,
                    fontWeight: FontWeight.w500,
                    color: kwhite),
              ),
            ),
          ])
        ]),
      ),
    );
  }

  Future<void> addTransaction() async {
    final amountText = _amountTextEditingController.text;
    final descriptionText = _descriptionTextEditingController.text;
    if (amountText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Center(
                child: Text(
          'Please enter an amount.',
          style: TextStyle(
            fontSize: 22,
            color: kred,
          ),
        ))),
      );
      return;
    }
    if (_categoryID == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Center(
                child: Text(
          'Please select a category.',
          style: TextStyle(
            fontSize: 22,
            color: kred,
          ),
        ))),
      );
      return;
    }
    if (descriptionText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Center(
                child: Text(
          'Please enter a description.',
          style: TextStyle(
            fontSize: 22,
            color: kred,
          ),
        ))),
      );
      return;
    }

    if (_selectedCategoryModel == null) {
      return;
    }
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Center(
                child: Text(
          'Please select a date.',
          style: TextStyle(
            fontSize: 22,
            color: kred,
          ),
        ))),
      );
      return;
    }

    final parsedAmount = double.tryParse(amountText);
    if (parsedAmount == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
          'Please enter a valid amount.',
          style: TextStyle(
            fontSize: 22,
            color: kred,
          ),
        )),
      );
      return;
    }

    final model = TransactionModel(
        amount: parsedAmount,
        type: _selectedCategorytype!,
        category: _selectedCategoryModel!,
        description: descriptionText,
        date: _selectedDate!);

    await transactionDB.instance.addTransaction(model);
    transactionDB.instance.refreshAll();
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BottomNav(),
    ));
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(bottom: 5),
        behavior: SnackBarBehavior.floating,
        content: Text(
          "Transaction added Successfully !",
          style: TextStyle(fontSize: 22, color: kgreen),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
