import 'package:flutter/material.dart';
import 'package:valores_nutricionais/modules/home_page/models/model.dart';
import 'package:valores_nutricionais/modules/home_page/models/repository.dart';

class HomeController {
  final homeFormKey = GlobalKey<FormState>();
  HomeModel model = HomeModel();
  SearchInformations repository = SearchInformations();

  searchFood(int food) => model.food = food;
  searchWeight(double weight) => model.weight = weight;

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
