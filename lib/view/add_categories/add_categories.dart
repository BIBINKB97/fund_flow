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
        onPressed: () {
          showCategoryAddPopup(context);
        },
        backgroundColor: ktheme,
        child: Icon(
          Icons.add,
          size: width * 0.07,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
                  Container(
                    decoration: BoxDecoration(
                        color: kblack54,
                        borderRadius: BorderRadius.circular(25)),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TabBar(
                      labelStyle: TextStyle(
                          fontSize: width * 0.050, fontWeight: FontWeight.w500),
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: kwhite,
                      ),
                      labelColor: kblack54,
                      unselectedLabelColor: Colors.white70,
                      tabs: const [
                        Tab(
                          text: 'Income',
                        ),
                        Tab(
                          text: 'Expense',
                        ),
                      ],
                    ),
                  ),
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
