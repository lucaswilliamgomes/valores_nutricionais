import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum InfoState { start, loading, sucess, error }

class InformationsController {
  final state = ValueNotifier<InfoState>(InfoState.start);
  Map? informations = {};

  Future<Map> getFoodInformations(int index) async {
    var url = Uri.parse('http://10.0.2.2:4000/api/v1/food/$index');
    var response = await http.get(url);
    final map = jsonDecode(response.body)[0];
    return map;
  }

  Future start() async {
    state.value = InfoState.loading;
    try {
      informations = await getFoodInformations(1);
      state.value = InfoState.sucess;
    } catch (e) {
      state.value = InfoState.error;
    }
  }
}
