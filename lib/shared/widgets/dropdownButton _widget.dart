import 'package:flutter/material.dart';
import 'package:valores_nutricionais/modules/home_page/controller/controller.dart';
import 'package:valores_nutricionais/shared/themes/colors.dart';
import 'package:valores_nutricionais/shared/themes/text_styles.dart';

class DropdownButtomWidget extends StatefulWidget {
  final HomeController controller;
  final List<String> itens;
  const DropdownButtomWidget({Key? key, required this.itens, required this.controller}) : super(key: key);
  
  @override
  _DropdownButtomWidgetState createState() => _DropdownButtomWidgetState();
}

class _DropdownButtomWidgetState extends State<DropdownButtomWidget> {
  String selected = "item 1";
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: EdgeInsets.only(top: 10, right: 30, left: 30),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 242, 242, 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButton<String>(
        hint: Text("Selecione um alimento"),
        style: TextStyle(
          color: AppColors.colorFont,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        isExpanded: true,
        underline: Container(),
        menuMaxHeight: 400,
        value: selected,
        onChanged: (String? newValue) {
          setState(() {
            selected = newValue!;
            widget.controller.onChange(food: widget.itens.indexOf(newValue));
          });
        },
        items: widget.itens
            .map<DropdownMenuItem<String>>((String element) => DropdownMenuItem(
                  child: Text(element),
                  value: element,
                ))
            .toList(),
      ),
    );
  }
}
