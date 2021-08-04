import 'package:flutter/material.dart';
import 'package:valores_nutricionais/modules/home_page/view/view.dart';
import 'package:valores_nutricionais/modules/splash_page/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
        //"/informations": (context) => InformationsPage(),
      },
    );
  }
}
