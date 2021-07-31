import 'package:flutter/material.dart';
import 'package:valores_nutricionais/shared/widgets/list_tile_widget.dart';

class ListAttributes extends StatelessWidget {
  final Map attributes;

  const ListAttributes({
    Key? key,
    required this.attributes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: attributes.length,
        itemBuilder: (BuildContext context, int index) {
          String key = attributes.keys.elementAt(index);
          return ListTileWidget(
            description: key,
            baseQty: "100",
            baseUnit: "g",
            resultQty: attributes[key]["qty"] == null
                ? ""
                : attributes[key]["qty"].toString(),
            resultUnit: attributes[key]["unit"] == null
                ? ""
                : attributes[key]["unit"],
          );
        });
  }
}
