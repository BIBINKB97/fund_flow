import 'package:flutter/material.dart';
import 'package:fund_flow/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fund Flow money_manager',
      home: HomePage(),
    );
  }
}
