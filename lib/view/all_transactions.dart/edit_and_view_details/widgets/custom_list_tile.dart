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
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 15),
      child: ListTile(
        leading: Icon(
          icon,
          color: kblack54,
          size: width * 0.075,
        ),
        title: RichText(
          text: TextSpan(
            text: title,
            style: TextStyle(
              fontSize: 17,
              color: kblack,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              TextSpan(
                text: text,
                style: TextStyle(
                  color: kblack,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
