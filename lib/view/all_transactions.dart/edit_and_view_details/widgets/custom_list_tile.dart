import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String text;
  final IconData icon;
  const CustomListTile({
    super.key,
    required this.title,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.03),
      child: ListTile(
        leading: Icon(
          icon,
          color: ktheme,
          size: width * 0.075,
        ),
        title: RichText(
          text: TextSpan(
            text: title,
            style: TextStyle(
              fontSize: width * 0.045,
              color: kblack,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                text: text,
                style: TextStyle(
                  color: ktheme,
                  fontSize: width * 0.045,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
