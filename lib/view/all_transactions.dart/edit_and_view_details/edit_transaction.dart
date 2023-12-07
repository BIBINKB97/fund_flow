



// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:fund_flow/controller/category_db/category_db.dart';
import 'package:fund_flow/controller/transaction_db/transaction_db.dart';
import 'package:fund_flow/model/category_model/category_model.dart';
import 'package:fund_flow/model/transaction_model/transaction_model.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/view/add_categories/add_categories.dart';
import 'package:fund_flow/view/home_page/bottom_navbar/bottom_nav.dart';
import 'package:intl/intl.dart';

class EditDetails extends StatefulWidget {
  TransactionModel data;

  EditDetails({super.key, required this.data});

  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  transactionDB transactiondB = transactionDB();
  DateTime? _selectedDate;
  CategoryType? _selectedCategorytype;
  CategoryModel? _selectedCategoryModel;

  String? _categoryID;

  final TextEditingController _amountTextEditingController =
      TextEditingController();
  final _descriptionTextEditingController = TextEditingController();

  @override
  void initState() {
    _selectedCategorytype = widget.data.type;
    _selectedDate = widget.data.date;
    _amountTextEditingController.text = widget.data.amount.toString();
    _descriptionTextEditingController.text = widget.data.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edit Details',
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
        child: Column(children: [
          Container(
            height: height * 0.28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: const [
                  ktheme
                  ,
                 kwhite,
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: height * 0.07),
                  Center(
                      child: Text(
                    'Enter Amount',
                    style: TextStyle(
                        fontSize: width * 0.08,
                        fontWeight: FontWeight.w800,
                        color: kwhite),
                  )),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Center(
                    child: SizedBox(
                      height: height * 0.095,
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
                              size: width * 0.08,
                            )),
                        cursorColor:kblack,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                            fontSize: width * 0.08,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: width * 0.116,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.data.type = CategoryType.income;
                    _selectedCategorytype = CategoryType.income;
                    _categoryID = null;
                  });
                },
                child: Container(
                  height: height * 0.070,
                  width: width * 0.35,
                  decoration: BoxDecoration(
                      color:  kgreen,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Radio(
                          activeColor: kwhite,
                          value: CategoryType.income,
                          groupValue: _selectedCategorytype,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCategorytype = newValue;
                              _categoryID = null;
                            });
                          }),
                      Text(
                        "Income",
                        style: TextStyle(
                            color: kwhite,
                            fontSize: width * 0.055,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.059,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    widget.data.type = CategoryType.expense;
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
                          activeColor : kwhite,
                          value: CategoryType.expense,
                          groupValue: _selectedCategorytype,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedCategorytype = newValue;
                              _categoryID = null;
                            });
                          }),
                      Text(
                        "Expense",
                        style: TextStyle(
                            color: kwhite,
                            fontSize: width * 0.055,
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
            children: [
              SizedBox(
                width: width * 0.06,
              ),
              Container(
                height: height * 0.075,
                width: width * 0.415,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: kgrey,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(),
                    hint: Text(
                      widget.data.category.name,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.w600),
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
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: width * 0.055,
                              fontWeight: FontWeight.w600),
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
              ),
              SizedBox(
                width: width * 0.040,
              ),
              Container(
                height: height * 0.075,
                width: width * 0.415,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: kgrey,
                    width: 1.2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
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
                            'New Category',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: width * 0.052,
                                fontWeight: FontWeight.w600),
                          )),
                    ],
                  ),
                ),
              ),
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
                  style: TextStyle(
                      fontSize: width * 0.052, fontWeight: FontWeight.w600),
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
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: width * 0.053,
                          fontWeight: FontWeight.w600),
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
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              color: ktheme,
              onPressed: () {
                EditedTansaction();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BottomNav(),
                ));
              },
              child: Text(
                'Save Changes',
                style: TextStyle(
                    fontSize: width * 0.052,
                    fontWeight: FontWeight.w500,
                    color: kwhite),
              ),
            ),
          ])
        ]),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> EditedTansaction() async {
    final amountText = _amountTextEditingController.text;
    final descriptionText = _descriptionTextEditingController.text;
    if (amountText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Center(
                child: Text(
          'Please enter an amount.',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.052,
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
            fontSize: MediaQuery.of(context).size.width * 0.052,
            color: kred,
          ),
        ))),
      );
      return;
    }
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Center(
                child: Text(
          'Please select a date.',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.052,
            color: kred,
          ),
        ))),
      );
      return;
    }

    final parsedAmount = double.tryParse(amountText);
    if (parsedAmount == null) {
      return;
    }

    final model = TransactionModel(
        amount: parsedAmount,
        type: _selectedCategorytype!,
        category: _selectedCategoryModel ?? widget.data.category,
        description: descriptionText,
        date: _selectedDate!,
        id: widget.data.id);

    await transactionDB.instance.editedTransaction(model);
    transactionDB.instance.refreshAll();
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: EdgeInsets.only(bottom: 42),
        behavior: SnackBarBehavior.floating,
        content: Text(
          "Changes Saved Successfully !",
          // ignore: use_build_context_synchronously
          style: TextStyle(
              // ignore: use_build_context_synchronously
              fontSize: MediaQuery.of(context).size.width * 0.052,
              fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        backgroundColor: kgreen,
      ),
    );
  }
}