import 'package:flutter/material.dart';
import 'package:valores_nutricionais/modules/home_page/home_controller.dart';
import 'package:valores_nutricionais/shared/themes/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

class DropdownButtomWidget extends StatefulWidget {
  final HomeController controller;
  final List<String> itens;
  const DropdownButtomWidget(
      {Key? key, required this.itens, required this.controller})
      : super(key: key);

  @override
  _DropdownButtomWidgetState createState() => _DropdownButtomWidgetState();
}

class _DropdownButtomWidgetState extends State<DropdownButtomWidget> {
  String selected = "Arroz, integral, cozido";

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 10, right: 30, left: 30),
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Color.fromRGBO(242, 242, 242, 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: SearchableDropdown.single(
          value: null,
          style: TextStyle(
            color: AppColors.colorFont,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          items: widget.itens
              .map<DropdownMenuItem<String>>(
                  (String element) => DropdownMenuItem(
                        child: Text(element),
                        value: element,
                      ))
              .toList(),
          onChanged: (String? newValue) {
            setState(() {
              selected = newValue!;
              widget.controller.onChange(food: widget.itens.indexOf(newValue));
            });
          },
          searchHint: null,
          dialogBox: false,
          hint: Text("Selecione um alimento"),
          isExpanded: true,
          menuConstraints: BoxConstraints.tight(Size.fromHeight(300)),
          displayClearIcon: false,
          underline: Container(),
        ));
  }
}
