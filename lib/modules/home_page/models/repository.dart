import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchInformations {

  Future<List> searchListFood() async {
    var url = Uri.parse('https://taco-food-api.herokuapp.com/api/v1/food/');
    var response = await http.get(url);
    final list = jsonDecode(response.body);
    return list;
  }
}