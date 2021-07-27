import 'package:flutter/material.dart';
import 'package:valores_nutricionais/modules/informations_page/controller.dart';
import 'package:valores_nutricionais/shared/themes/colors.dart';
import 'package:valores_nutricionais/shared/themes/text_styles.dart';
import 'package:valores_nutricionais/shared/widgets/list_tile_widget.dart';

class InformationsPage extends StatefulWidget {
  @override
  _InformationsPageState createState() => _InformationsPageState();
}

class _InformationsPageState extends State<InformationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorBackgroundLight,
        elevation: 0,
        leading: BackButton(
          color: AppColors.colorFont,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: AppColors.colorBackgroundLight,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 15),
                alignment: Alignment.topLeft,
                child: Text(
                  "Arroz integral",
                  style: TextStyles.title,
                ),
              ),
              ListTileWidget(
                  description: "Proteinas",
                  baseQty: 100,
                  baseUnit: "g",
                  resultQty: 20,
                  resultUnit: "g"),
              ListTileWidget(
                  description: "Proteinas",
                  baseQty: 100,
                  baseUnit: "g",
                  resultQty: 20,
                  resultUnit: "g"),
              ListTileWidget(
                  description: "Proteinas",
                  baseQty: 100,
                  baseUnit: "g",
                  resultQty: 20,
                  resultUnit: "g"),
              ListTileWidget(
                  description: "Proteinas",
                  baseQty: 100,
                  baseUnit: "g",
                  resultQty: 20,
                  resultUnit: "g"),
              ListTileWidget(
                  description: "Proteinas",
                  baseQty: 100,
                  baseUnit: "g",
                  resultQty: 20,
                  resultUnit: "g"),
              ListTileWidget(
                  description: "Proteinas",
                  baseQty: 100,
                  baseUnit: "g",
                  resultQty: 20,
                  resultUnit: "g"),
              ListTileWidget(
                  description: "Proteinas",
                  baseQty: 100,
                  baseUnit: "g",
                  resultQty: 20,
                  resultUnit: "g"),
              ListTileWidget(
                  description: "Proteinas",
                  baseQty: 100,
                  baseUnit: "g",
                  resultQty: 20,
                  resultUnit: "g"),
              ListTileWidget(
                  description: "Proteinas",
                  baseQty: 100,
                  baseUnit: "g",
                  resultQty: 20,
                  resultUnit: "g"),
              ListTileWidget(
                  description: "Proteinas",
                  baseQty: 100,
                  baseUnit: "g",
                  resultQty: 20,
                  resultUnit: "g"),
            ],
          ),
        ),
      ),
    );
  }
}
