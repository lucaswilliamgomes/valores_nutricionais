import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchInformations {
  Future<List> searchListFood() async {
    final url = Uri.parse('https://taco-api-lucas.herokuapp.com/api/v1/food/');
    final response = await http.get(url);
    final list = jsonDecode(response.body);
    return list;
  }
}