import 'package:flutter/material.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/view/add_Transactions/add_transactions.dart';
import 'package:fund_flow/view/settings/settings.dart';
import 'package:fund_flow/view/statitics/statitics.dart';
import 'package:fund_flow/view/home_page/home_page.dart';
import 'package:fund_flow/view/all_transactions.dart/all_transactions.dart';
import 'package:iconly/iconly.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  final screens = [
    HomePage(),
    TransactionList(),
    AddTransaction(),
    Statitics(),
    Settings(),
  ];
  final List<BottomNavigationBarItem> _bottomNavbarItems = [
    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.home,
        size: 27,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.compare_arrows,
        size: 30,
      ),
      label: 'Transactions',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.plus,
        size: 27,
      ),
      label: 'Add Transaction',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.graph,
        size: 27,
      ),
      label: 'Statitics',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        IconlyBold.setting,
        size: 27,
      ),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          unselectedItemColor: kgrey,
          elevation: 0,
          selectedItemColor: ktheme,
          backgroundColor: kblack,
          items: _bottomNavbarItems,
          onTap: (index) => setState(() => selectedIndex = index),
        ),
      ),
    );
  }
}
