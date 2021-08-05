import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:valores_nutricionais/modules/home_page/home_controller.dart';
import 'package:valores_nutricionais/shared/themes/colors.dart';
import 'package:valores_nutricionais/shared/widgets/dropdownButton%20_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  @override
  void initState() {
    controller.start();
    super.initState();
  }

  _loading() {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.colorBackgroundDark,
        strokeWidth: 2.2,
      ),
    );
  }

  _sucess(double _height) {
    return Container(
      height: _height,
      alignment: Alignment.center,
      color: AppColors.colorBackgroundLight,
      child: Form(
        key: controller.homeFormKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(left: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "ALIMENTO",
                  style: TextStyle(
                    color: AppColors.colorFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              DropdownButtomWidget(
                itens: controller.listFoods,
                controller: controller,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, top: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  "QUANTIDADE EM GRAMAS",
                  style: TextStyle(
                    color: AppColors.colorFont,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 30, left: 30),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  textAlignVertical: TextAlignVertical.top,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(242, 242, 242, 1),
                    filled: true,
                    hintText: "ex. 100",
                    contentPadding: EdgeInsets.only(left: 20, right: 20),
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide.none),
                  ),
                  validator: controller.validator,
                  onChanged: (value) {
                    controller.onChange(weight: double.tryParse(value));
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 30, left: 30),
                child: MaterialButton(
                  height: 45,
                  minWidth: 200,
                  child: Text(
                    "OBTER INFORMAÇÕES",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  color: AppColors.colorButtomDark,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  onPressed: () {
                    setState(() {
                      controller.saveFormKey(controller, context);
                    });
                  },
                ),
              ),
            ]),
          ),
        ),
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

  stateManager(InfoStateHome state, double height) {
    if (state == InfoStateHome.loading)
      return _loading();
    else if (state == InfoStateHome.sucess)
      return _sucess(height);
    else if (state == InfoStateHome.error)
      return _error();
    else
      return _start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        final height = constraints.maxHeight;
        //final _width = constraints.maxWidth;
        return ValueListenableBuilder(
          valueListenable: controller.state,
          builder: (BuildContext context, value, Widget? child) {
            return stateManager(controller.state.value, height);
          },
        );
      }),
    );
  }
}
