import 'dart:convert';
import 'package:ending_wars/models/film.dart';
import 'package:ending_wars/models/root.dart';
import 'package:http/http.dart' as http;

const String endpoint = 'https://swapi.dev/api/';

class BaseConfig {
  Future<Root> getData() async {
    http.Response response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var root = Root.fromJson(jsonData);
      return root;
    } else {
      throw Exception(
          "Something went wrong getting API response, ${response.statusCode}");
    }
  }

  Future<List<Film>> getSpecificData(String dataName, dynamic type) async {
    http.Response response = await http.get(Uri.parse(endpoint + dataName));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['results'] as List<dynamic>;
      return jsonData.map((filmJson) => Film.fromJson(filmJson)).toList();
    } else {
      throw Exception(
          "Something went wrong getting $dataName API response, ${response.statusCode}");
    }
  }

  Future<List<String>> getNestedData(String resourceName, List<String> resourceEndpoints) async {
    List<String> nestedData = [];
    String subName;

    switch(resourceName) {
      case 'films':
        subName = 'title';
        break;
      default:
        subName = 'name';
        break;
    }

    for(var endpoint in resourceEndpoints.take(3)) {
      http.Response response = await http.get(Uri.parse(endpoint));
      if(response.statusCode == 200) {
        var jsonData = jsonDecode(response.body)[subName] as String;
        nestedData.add(jsonData);
      }
    }

    return nestedData;
  }
}
