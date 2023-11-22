import 'package:flutter/material.dart';
import 'package:fund_flow/database/category_db/category_db.dart';
import 'package:fund_flow/model/category_model/category_model.dart';
import 'package:lottie/lottie.dart';

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
                  final Category = newList[indext];
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: ListTile(
                      title: Text(
                        (Category.name),
                        style: TextStyle(
                            fontSize: width * 0.055,
                            fontWeight: FontWeight.w600),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            CategoryDB.instance.deleteCategory(Category.id);
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
            : Center(
                child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.15,
                    ),
                    ColorFiltered(
                      colorFilter:
                          ColorFilter.mode(Colors.black, BlendMode.srcIn),
                      child: Lottie.asset(
                        'images/noresults.json',
                        width: width * 0.3,
                      ),
                    ),
                    Text(
                      "   No categories added yet !",
                      style: TextStyle(
                        fontSize: width * 0.07,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ));
      },
    );
  }
}