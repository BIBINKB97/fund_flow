import 'package:flutter/material.dart';
import 'package:fund_flow/controller/category_db/category_db.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/view/add_categories/add_category_popup.dart';
import 'package:fund_flow/view/add_categories/expense_category_list.dart';
import 'package:fund_flow/view/add_categories/income_category_list.dart';

class AddCategories extends StatefulWidget {
  const AddCategories({super.key});

  @override
  State<AddCategories> createState() => _AddCategoriesState();
}

class _AddCategoriesState extends State<AddCategories> {
  CategoryDB categoryDB = CategoryDB();
  @override
  void initState() {
    super.initState();
    categoryDB.refreshUI();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add New Category',
          style: TextStyle(
              fontSize: width * 0.06,
              fontWeight: FontWeight.w600,
              color: kwhite),
        ),
        toolbarHeight: 70,
        elevation: 1,
        backgroundColor: ktheme,
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          showCategoryAddPopup(context);
        },
        backgroundColor: ktheme,
        child: Icon(
          Icons.add,
          size: width * 0.1,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: DefaultTabController(
          length: 2,
          child: Column(children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.9,
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
                child: Column(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.009,
                  ),
                  TabBar(
                      indicatorColor: ktheme,
                      tabs: [
                        Tab(
                          child: Text(
                            'Income',
                            style: TextStyle(
                                fontSize: width * 0.055,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Expense',
                            style: TextStyle(
                                fontSize: width * 0.055,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.9 -
                        kToolbarHeight,
                    child: TabBarView(
                      children: const [
                        IncomeCategoryList(),
                        ExpenseCategoryList(),
                      ],
                    ),
                  ),
                ])),
          ]),
        ),
      ),
    );
  }
}