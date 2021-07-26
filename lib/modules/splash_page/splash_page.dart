import 'package:flutter/material.dart';
import 'package:valores_nutricionais/modules/splash_page/controller.dart';
import 'package:valores_nutricionais/shared/themes/colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SplashController();
    controller.delay(context);
    return Container(
      color: AppColors.colorBackgroundLight,
      child: Center(
          child: Container(
        height: 350,
        width: 350,
        child: Image.asset("assets/images/splash.png"),
      )),
    );
  }
}
