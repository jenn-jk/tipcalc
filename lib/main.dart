import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tipcalc/theme_provider.dart';
import 'package:tipcalc/tip_calc_model.dart';
import 'package:tipcalc/app.dart';

void main() {
  runApp(MultiProvider(providers: [
  ChangeNotifierProvider(create: (context) => TipCalcModel()),
  ChangeNotifierProvider(create: (context) => ThemeProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Tip Calculator',
      theme: themeModel.getCurrentTheme(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      home: TipCalc(),
    );
  }
}
