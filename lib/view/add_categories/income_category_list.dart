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
            ? ListView.separated(
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
                                CategoryDB.instance.deleteCategory(category.id);
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
              )
            : NoCategories();
      },
    );
  }
}
