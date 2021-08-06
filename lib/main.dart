import 'package:flutter/material.dart';
import 'package:valores_nutricionais/modules/home_page/home_page.dart';
import 'package:valores_nutricionais/modules/splash_page/splash_page.dart';
import 'package:valores_nutricionais/shared/themes/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: AppColors.colorBackgroundDark,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
        //"/informations": (context) => InformationsPage(),
      },
    );
  }
}
