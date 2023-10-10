import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fund_flow/model/category_model/category_model.dart';
import 'package:fund_flow/model/transaction_model/transaction_model.dart';
import 'package:fund_flow/utils/colors.dart';
import 'package:fund_flow/view/splash_screens/splash1.dart';
import 'package:fund_flow/view/splash_screens/splash2.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(CategoryTypeAdapter().typeId)) {
    Hive.registerAdapter(CategoryTypeAdapter());
  }
  if (!Hive.isAdapterRegistered(CategoryModelAdapter().typeId)) {
    Hive.registerAdapter(CategoryModelAdapter());
  }
  if (!Hive.isAdapterRegistered(TransactionModelAdapter().typeId)) {
    Hive.registerAdapter(TransactionModelAdapter());
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenSplash = prefs.getBool('hasSeenSplash') ?? false;

    runApp(MyApp(hasSeenSplash));
  });
}

class MyApp extends StatelessWidget {
  final bool hasSeenSplash;
  const MyApp(this.hasSeenSplash, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: customColor),
      debugShowCheckedModeBanner: false,
      home: hasSeenSplash ? Splash2() : Splash1(),
    );
  }
}
