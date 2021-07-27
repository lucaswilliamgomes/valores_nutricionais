import 'dart:convert';

import 'package:http/http.dart' as http;

class InformationsController {

  Future<void> teste () async {
    var url = Uri.parse('https://taco-food-api.herokuapp.com/api/v1/food/1');
    var response = await http.get(url);
    final mapp = jsonDecode(response.body);
    print(mapp[0]['description']);
  }


}