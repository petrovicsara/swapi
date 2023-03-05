import 'dart:convert';
import 'package:ending_wars/models/root.dart';
import 'package:http/http.dart' as http;

const String endpoint = 'https://swapi.dev/api/';

class BaseConfig {
  Future<Root> getData() async {
    http.Response response = await http.get(Uri.parse(endpoint));

    if(response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var root = Root.fromJson(jsonData);
      return root;
    } else {
      throw Exception("Something went wrong getting API response, ${response.statusCode}");
    }
  }

}