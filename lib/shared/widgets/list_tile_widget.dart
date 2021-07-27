import 'package:flutter/material.dart';
import 'package:valores_nutricionais/shared/themes/text_styles.dart';

class ListTileWidget extends StatelessWidget {
  final String description;
  final double baseQty;
  final String baseUnit;
  final double resultQty;
  final String resultUnit;

  const ListTileWidget({
    Key? key,
    required this.description,
    required this.baseQty,
    required this.baseUnit,
    required this.resultQty,
    required this.resultUnit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "$description",
            style: TextStyles.titleTile,
          ),
          subtitle: Text(
            "A cada $baseQty $baseUnit",
            style: TextStyles.subtitleTile,
          ),
          trailing: Text.rich(TextSpan(
              text: "$resultQty ",
              //textAlign: TextAlign.center,
              style: TextStyles.titleTile,
              children: [
                TextSpan(
                  text: "$resultUnit",
                  style: TextStyles.subtitleTile,
                )
              ])),
        ),
        Divider(
          thickness: 1,
        )
      ],
    );
  }
}
