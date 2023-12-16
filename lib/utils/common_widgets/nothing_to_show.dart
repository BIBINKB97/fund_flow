import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:lottie/lottie.dart';

class NothingToShow extends StatelessWidget {
  final Color color;
  const NothingToShow({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(kblack, BlendMode.srcIn),
            child: Lottie.asset(
              'images/noresults.json',
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ),
          Text(
            "  No transactions yet !",
            style: TextStyle(
              fontSize: 22,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
