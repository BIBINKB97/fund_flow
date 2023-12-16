import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';

class CustomListSettings extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onTap;
  const CustomListSettings({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: ListTile(
            onTap: onTap,
            leading: Icon(
              icon,
              color: kblack54,
              size: width * 0.08,
            ),
            title: Text(
              text,
              style: TextStyle(
                  fontSize: width * 0.052, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}
