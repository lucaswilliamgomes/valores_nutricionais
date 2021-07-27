import 'package:flutter/material.dart';
import 'package:valores_nutricionais/shared/themes/text_styles.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            "Proteina",
            style: TextStyles.titleTile,
          ),
          subtitle: Text(
            "A cada 100 gramas",
            style: TextStyles.subtitleTile,
          ),
          trailing: Text.rich(TextSpan(
              text: "2121\n",
              //textAlign: TextAlign.center,
              style: TextStyles.titleTile,
              children: [
                TextSpan(
                  text: "gramas",
                  style: TextStyles.subtitleTile,
                )
              ])),
        ),
        Divider()
      ],
    );
  }
}
