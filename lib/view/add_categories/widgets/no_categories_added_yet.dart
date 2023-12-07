import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:lottie/lottie.dart';

class NoCategories extends StatelessWidget {
  const NoCategories({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
        child: Center(
      child: Column(
        children: [
          SizedBox(
            height: height * 0.15,
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(kblack, BlendMode.srcIn),
            child: Lottie.asset(
              'images/noresults.json',
              width: width * 0.25,
            ),
          ),
          Text(
            "   No categories added yet !",
            style: TextStyle(
              fontSize: width * 0.055,
              color: kblack54,
            ),
          ),
        ],
      ),
    ));
  }
}
