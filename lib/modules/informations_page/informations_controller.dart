import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum InfoState { start, loading, sucess, error }

class InformationsController {
  final Map translations = {
    "humidity": "Humidade",
    "protein": "Proteínas",
    "lipid": "Lipídios",
    "cholesterol": "Colesterol",
    "carbohydrate": "Carboidratos",
    "fiber": "Fibras",
    "ashes": "Cinzas",
    "calcium": "Cálcio",
    "magnesium": "Magnésio",
    "phosphorus": "Fósforo",
    "iron": "Ferro",
    "sodium": "Sódio",
    "potassium": "Potássio",
    "copper": "Cobre",
    "zinc": "Zinco",
    "retinol": "Retinol",
    "thiamine": "Tiamina",
    "riboflavin": "Riboflavina (Vitamina B2)",
    "pyridoxine": "Piridoxina (Vitamina B6)",
    "niacin": "Niacina (Vitamina B3)",
    "energy": "Energia",
    "fatty_acids": "Ácidos Graxos",
    "manganese": "Manganês"
  };

  final state = ValueNotifier<InfoState>(InfoState.start);
  Map? informations = {};

  Future<Map> getFoodInformations(int index) async {
    var url =
        Uri.parse('https://taco-food-api.herokuapp.com/api/v1/food/$index');
    var response = await http.get(url);
    final map = jsonDecode(response.body)[0];
    return map;
  }

  Future<void> start(int index) async {
    state.value = InfoState.loading;
    try {
      informations = await getFoodInformations(index);
      state.value = InfoState.sucess;
    } catch (e) {
      state.value = InfoState.error;
    }
  }
}
