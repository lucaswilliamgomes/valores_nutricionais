

import 'package:flutter/material.dart';

class SplashController{
  Future<void> delay(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushNamed(context, "/home");
  }
}