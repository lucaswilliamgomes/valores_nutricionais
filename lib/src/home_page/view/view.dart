import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:valores_nutricionais/src/app/colors.dart';
import 'package:valores_nutricionais/src/home_page/controller/controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      final _height = constraints.maxHeight;
      final _width = constraints.maxWidth;
      return Container(
        alignment: Alignment.center,
        color: colorBackgroundLight,
        child: Form(
          key: controller.homeFormKey,
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: _height * .3, left: 30),
              alignment: Alignment.centerLeft,
              child: Text(
                "ALIMENTO",
                style: TextStyle(
                  color: colorFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 30, left: 30),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(242, 242, 242, 1),
                  filled: true,
                  hintText: "Arroz",
                  contentPadding: EdgeInsets.only(left: 20, right: 20),
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, top: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                "QUANTIDADE EM GRAMAS",
                style: TextStyle(
                  color: colorFont,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 30, left: 30),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  fillColor: Color.fromRGBO(242, 242, 242, 1),
                  filled: true,
                  hintText: "100",
                  contentPadding: EdgeInsets.only(left: 20, right: 20),
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, right: 30, left: 30),
              child: MaterialButton(
                height: 45,
                minWidth: 200,
                child: Text(
                  "CONTINUAR",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                color: colorButtomDark,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                onPressed: () {
                  setState(() {
                    _formKey.currentState.save();
                  });
                },
              ),
            ),
          ]),
        ),
      );
    }));
  }
}
