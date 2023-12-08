import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fund_flow/controller/category_db/category_db.dart';
import 'package:fund_flow/model/category_model/category_model.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/view/add_categories/widgets/no_categories_added_yet.dart';

class IncomeCategoryList extends StatelessWidget {
  const IncomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
      valueListenable: CategoryDB().incomeCategoryListListner,
      builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
        return newList.isNotEmpty
            ? SlideInUp(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemBuilder: (context, indext) {
                      final category = newList[indext];

                      return Container(
                        height: 50,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                (category.name),
                                style: TextStyle(
                                    fontSize: width * 0.055,
                                    color: kblack54,
                                    fontWeight: FontWeight.w500),
                              ),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                              'Alert !',
                                              style: TextStyle(
                                                  color: kred,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            content: Text(
                                              'Do you want to delete this category ?',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: kblue,
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  )),
                                              TextButton(
                                                  onPressed: () {
                                                    CategoryDB.instance
                                                        .deleteCategory(
                                                            category.id);

                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        color: kred,
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ))
                                            ],
                                          );
                                        });
                                  },
                                  icon: CircleAvatar(
                                    backgroundColor: kblack54,
                                    child: Icon(
                                      Icons.delete,
                                      color: kred,
                                    ),
                                  ))
                            ]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return Divider(
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.white54,
                      );
                    },
                    itemCount: newList.length,
                  ),
                ),
              )
            : NoCategories();
      },
    );
  }
}
