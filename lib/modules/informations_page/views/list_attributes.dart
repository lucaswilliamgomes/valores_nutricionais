import 'package:flutter/material.dart';
import 'package:valores_nutricionais/shared/widgets/list_tile_widget.dart';

class ListAttributes extends StatelessWidget {
  final Map attributes;
  final double baseQty;

  const ListAttributes({
    Key? key,
    required this.attributes,
    required this.baseQty,
  }) : super(key: key);

  String treatmentDataQty(var data) {
    if (data == null || data is String) return 0.toStringAsFixed(2);
    if (data is Map) {
      return "is a map";
    }
    return ((data / 100) * baseQty).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    attributes.remove("humidity");
    attributes.remove("fatty_acids");
    return ListView.builder(
        itemCount: attributes.length,
        itemBuilder: (BuildContext context, int index) {
          String key = attributes.keys.elementAt(index);
          return ListTileWidget(
            description: key,
            baseQty: baseQty.toStringAsFixed(2),
            baseUnit: "g",
            resultQty: attributes[key]["qty"] == null
                ? treatmentDataQty(attributes[key]["kcal"])
                : treatmentDataQty(attributes[key]["qty"]),
            resultUnit: attributes[key]["unit"] == null
                ? "kcal"
                : attributes[key]["unit"],
          );
        });
  }
}
