import 'package:flutter/material.dart';
import 'package:valores_nutricionais/shared/themes/colors.dart';
import 'package:valores_nutricionais/shared/themes/text_styles.dart';

class DropdownButtomWidget extends StatefulWidget {
  const DropdownButtomWidget({Key? key, required this.itens}) : super(key: key);
  final List<String> itens;
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
      color: Color.fromRGBO(242, 242, 242, 1),
      child: DropdownButton<String>(
        style: TextStyle(
          color: AppColors.colorFont,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        isExpanded: true,
        underline: Container(),
        value: selected,
        onChanged: (String? newValue) {
          setState(() {
            selected = newValue!;
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
