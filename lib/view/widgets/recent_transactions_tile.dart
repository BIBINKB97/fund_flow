import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';

class RecentTracnsactionsTile extends StatelessWidget {
  const RecentTracnsactionsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
              leading: Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: kgreen,
                      ),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'View All',
                  style: TextStyle(
                    color: kblack,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
              );

  }
}