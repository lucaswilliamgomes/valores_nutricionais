import 'package:flutter/material.dart';
import 'package:valores_nutricionais/modules/home_page/models/home_model.dart';
import 'package:valores_nutricionais/modules/home_page/models/home_repository.dart';
import 'package:valores_nutricionais/modules/informations_page/informations_page.dart';

enum InfoStateHome { start, loading, sucess, error }

class HomeController {
  final state = ValueNotifier<InfoStateHome>(InfoStateHome.start);
  final homeFormKey = GlobalKey<FormState>();
  HomeModel model = HomeModel();
  SearchInformations repository = SearchInformations();

  List<String> listFoods = [];

  String? validatorQty(String? value) {
    if (value?.isEmpty == true || value == null) return "Este campo deve ser preenchido!";
    if (double.tryParse(value) == null) {
      return "Valor inválido!";
    }
  }

  String? validatorFood(String? value) {
    if (value?.isEmpty == true || value == null) return "Este campo deve ser preenchido!";
  }
      

  void onChange({int? food, double? weight}) {
    model = model.copyWith(
      food: food,
      weight: weight,
    );
  }

  Future<List> chargeFoods() async {
    List list = await repository.searchListFood();
    return list;
  }

  Future<void> saveFormKey(
    HomeController controller,
    BuildContext context,
  ) async {
    final formKey = controller.homeFormKey;
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState!.save();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => InformationsPage(
                  index: model.food == null ? 1 : model.food! + 1,
                  weight: model.weight!,
                )));
  }

  Future<void> start() async {
    state.value = InfoStateHome.loading;
    try {
      List list = await chargeFoods();
      for (var item in list) {
        listFoods.add(item['description']);
      }
      state.value = InfoStateHome.sucess;
    } catch (e) {
      print(e.toString());
      state.value = InfoStateHome.error;
    }
  }
}
