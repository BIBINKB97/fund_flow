import 'package:flutter/material.dart';
import 'package:fund_flow/controller/category_db/category_db.dart';
import 'package:fund_flow/model/category_model/category_model.dart';
import 'package:fund_flow/view/add_categories/widgets/no_categories_added_yet.dart';

class ExpenseCategoryList extends StatelessWidget {
  const ExpenseCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expenseCategoryListListner,
      builder: (BuildContext ctx, List<CategoryModel> newList, Widget? _) {
        return newList.isNotEmpty
            ? ListView.separated(
                itemBuilder: (context, indext) {
                  final category = newList[indext];
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: ListTile(
                      title: Text(
                        (category.name),
                        style: TextStyle(
                            fontSize: width * 0.055,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            CategoryDB.instance.deleteCategory(category.id);
                          },
                          icon: Icon(Icons.delete)),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.002,
                  );
                },
                itemCount: newList.length,
              )
            : NoCategories();
      },
    );
  }
}
