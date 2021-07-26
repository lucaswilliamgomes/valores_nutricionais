import 'package:flutter/material.dart';
import 'package:valores_nutricionais/shared/themes/colors.dart';

class InformationsPage extends StatefulWidget {
  @override
  _InformationsPageState createState() => _InformationsPageState();
}

class _InformationsPageState extends State<InformationsPage> {
  List <Widget>_buildList() {
    List<Widget> listFields = [];

    listFields.add(Container(
        alignment: Alignment.bottomLeft,
        margin: EdgeInsets.only(top: 75, left: 35),
        child: InkWell(
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppColors.colorButtomDark,
            ),
            onTap: () {
              Navigator.pop(context);
            })));
    listFields.add(LayoutBuilder(builder: (context, constraints) {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 35, right: 35),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Flexible(
                child: Text(
                  "Nome do Alimento",
                  style: TextStyle(
                      fontSize: 27,
                      color: AppColors.colorFont,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Proteina",
                          style: TextStyle(
                            fontSize: 23,
                            color: AppColors.colorFont,
                            fontWeight: FontWeight.w400
                          ),
                        )
                      ),
                      Container(
                        child: Text(
                          "2588\ngramas",
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.colorFont
                          ),
                        ),
                      )
                    ],
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      );
    }));

    return listFields;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: AppColors.colorBackgroundLight,
        child: CustomScrollView(
          slivers: [
            SliverList(delegate: SliverChildListDelegate(_buildList()))
          ],
        ),
      ),
    );
  }
}
