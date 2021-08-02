import 'package:flutter/material.dart';
import 'package:valores_nutricionais/modules/home_page/models/model.dart';
import 'package:valores_nutricionais/modules/home_page/models/repository.dart';

class HomeController {
  final homeFormKey = GlobalKey<FormState>();
  HomeModel model = HomeModel();
  SearchInformations repository = SearchInformations();

  String? validator(String? value) =>
    value?.isEmpty ?? true ? "Este campo deve ser preenchido!" : null;

  void onChange({
    int? food,
    double? weight

  }) {
    model = model.copyWith(
      food: food,
      weight: weight,
    );
    print(model);
  }
  
  Future<bool> search() async {
    if (!homeFormKey.currentState!.validate()) {
      return false;
    }

    homeFormKey.currentState!.save();

    try {
      return await repository.search(model);
    } catch (e) {
      return false;
    }
  }
}
