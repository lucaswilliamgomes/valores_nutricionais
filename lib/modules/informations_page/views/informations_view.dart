import 'package:flutter/material.dart';
import 'package:valores_nutricionais/modules/informations_page/controllers/informations_controller.dart';
import 'package:valores_nutricionais/modules/informations_page/views/list_attributes.dart';
import 'package:valores_nutricionais/shared/themes/colors.dart';
import 'package:valores_nutricionais/shared/themes/text_styles.dart';
import 'package:valores_nutricionais/shared/widgets/list_tile_widget.dart';

class InformationsPage extends StatefulWidget {
  @override
  _InformationsPageState createState() => _InformationsPageState();
}

class _InformationsPageState extends State<InformationsPage> {
  final controller = InformationsController();

  _loading() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.colorBackgroundDark,
        strokeWidth: 2.2,
      ),
    );
  }

  _sucess() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: AppColors.colorBackgroundLight,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 15, bottom: 15),
            alignment: Alignment.topLeft,
            child: Text(
              "${controller.informations!['description']}",
              style: TextStyles.title,
            ),
          ),
          Flexible(
            child: ListAttributes(
              attributes: controller.informations!['attributes'],
            ),
          )
        ],
      ),
    );
  }

  _error() {
    return Center(
      child: ElevatedButton(
        child: Text("Tente novamente"),
        onPressed: () {
          controller.start();
        },
      ),
    );
  }

  _start() {
    return Container();
  }

  stateManager(InfoState state) {
    if (state == InfoState.loading)
      return _loading();
    else if (state == InfoState.sucess)
      return _sucess();
    else if (state == InfoState.error)
      return _error();
    else
      return _start();
  }

  @override
  void initState() {
    super.initState();
    controller.start();
  }

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
        body: ValueListenableBuilder(
          valueListenable: controller.state,
          builder: (BuildContext context, value, Widget? child) {
            return stateManager(controller.state.value);
          },
        ));
  }
}
