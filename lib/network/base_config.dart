import 'dart:convert';
import 'package:ending_wars/models/film.dart';
import 'package:ending_wars/models/person.dart';
import 'package:ending_wars/models/planet.dart';
import 'package:ending_wars/models/species.dart';
import 'package:ending_wars/models/starship.dart';
import 'package:ending_wars/models/vehicle.dart';
import 'package:http/http.dart' as http;

const String endpoint = 'https://swapi.dev/api/';

class BaseConfig {
  Future<Map<String, String>> getData() async {
    http.Response response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      Map<String, String> data = {};
      jsonData.forEach((key, value) {
        data[key] = value.toString();
      });

      return data;
    } else {
      throw Exception(
          "Something went wrong getting API response, ${response.statusCode}");
    }
  }

  Future<List<dynamic>> getSpecificData(String dataName) async {
    http.Response response = await http.get(Uri.parse(endpoint + dataName));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['results'] as List<dynamic>;
      switch(dataName) {
        case 'film':
          return jsonData.map((filmJson) => Film.fromJson(filmJson)).toList();
        case 'people':
          return jsonData.map((personJson) => Person.fromJson(personJson)).toList();
        case 'planets':
          return jsonData.map((personJson) => Planet.fromJson(personJson)).toList();
        case 'species':
          return jsonData.map((personJson) => Species.fromJson(personJson)).toList();
        case 'vehicles':
          return jsonData.map((personJson) => Vehicle.fromJson(personJson)).toList();
        case 'starships':
          return jsonData.map((personJson) => Starship.fromJson(personJson)).toList();

      }
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
