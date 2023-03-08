import 'dart:convert';
import 'package:ending_wars/models/film.dart';
import 'package:ending_wars/models/fuzzy.dart';
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

  Future<List<dynamic>> getSpecificDataList(String resourceNameType) async {
    http.Response response = await http.get(Uri.parse(endpoint + resourceNameType));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['results'] as List<dynamic>;
      switch(resourceNameType) {
        case 'film':
          return jsonData.map((json) => Film.fromJson(json)).toList();
        case 'people':
          return jsonData.map((json) => Person.fromJson(json)).toList();
        case 'planets':
          return jsonData.map((json) => Planet.fromJson(json)).toList();
        case 'species':
          return jsonData.map((json) => Species.fromJson(json)).toList();
        case 'vehicles':
          return jsonData.map((json) => Vehicle.fromJson(json)).toList();
        case 'starships':
          return jsonData.map((json) => Starship.fromJson(json)).toList();
      }
      return jsonData.map((filmJson) => Film.fromJson(filmJson)).toList();
    } else {
      throw Exception(
          "Something went wrong getting $resourceNameType API response, ${response.statusCode}");
    }
  }

  Future<dynamic> getSpecificData(String resourceNameType, String searchResult) async {
    http.Response response = await http.get(Uri.parse('$endpoint$resourceNameType/?search=$searchResult'));

    if(response.statusCode == 200) {
      var jsonData = jsonDecode(response.body)['results'];

      switch(resourceNameType) {
        case 'film':
          return jsonData.map((json) => Film.fromJson(json)).toList().first;
        case 'people':
          return jsonData.map((json) => Person.fromJson(json)).toList().first;
        case 'planets':
          return jsonData.map((json) => Planet.fromJson(json)).toList().first;
        case 'species':
          return jsonData.map((json) => Species.fromJson(json)).toList().first;
        case 'vehicles':
          return jsonData.map((json) => Vehicle.fromJson(json)).toList().first;
        case 'starships':
          return jsonData.map((json) => Starship.fromJson(json)).toList().first;
      }
    } else {
      throw Exception(
          "Something went wrong getting $resourceNameType API response, ${response.statusCode}");
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

  //Fuzzy search data
  Future<Fuzzy> getFuzzyData() async {
    http.Response response = await http.get(Uri.parse(endpoint));

    if(response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      //Films titles
      final filmResponse = await http.get(Uri.parse(jsonData['films']));
      final filmData = jsonDecode(filmResponse.body);
      List<String> filmTitles = [];
      for(var film in filmData['results']) {
        filmTitles.add(film['title']);
      }

      //People names
      final peopleResponse = await http.get(Uri.parse(jsonData['people']));
      final peopleData = jsonDecode(peopleResponse.body);
      List<String> peopleNames = [];
      for(var person in peopleData['results']) {
        peopleNames.add(person['name']);
      }

      //Planet names
      final planetResponse = await http.get(Uri.parse(jsonData['planets']));
      final planetData = jsonDecode(planetResponse.body);
      List<String> planetTitles = [];
      for(var planet in planetData['results']) {
        planetTitles.add(planet['name']);
      }

      Fuzzy fuzzy = Fuzzy(filmTitles, peopleNames, planetTitles);

      return fuzzy;
    } else {
      throw Exception(
          "Something went wrong getting API response, ${response.statusCode}");
    }
  }

  List<String> fuzzySearch(String searchTerm, Fuzzy fuzzy) {
    final matches = <String, int>{};

    //Films
    for (final item in fuzzy.films) {
      final distance =
      levenshteinDistance(searchTerm.toLowerCase(), item.toLowerCase());
      if (distance <= searchTerm.length) {
        matches['Film: $item'] = distance;
      }
    }

    //People
    for (final item in fuzzy.people) {
      final distance =
      levenshteinDistance(searchTerm.toLowerCase(), item.toLowerCase());
      if (distance <= searchTerm.length) {
        matches['People: $item'] = distance;
      }
    }

    //Planets
    for (final item in fuzzy.planets) {
      final distance =
      levenshteinDistance(searchTerm.toLowerCase(), item.toLowerCase());
      if (distance <= searchTerm.length) {
        matches['Planets: $item'] = distance;
      }
    }

    return matches.keys.toList()..sort((a, b) => matches[a]! - matches[b]!);
  }

  int levenshteinDistance(String s1, String s2) {
    var m = s1.length;
    var n = s2.length;
    var d = List.generate(m + 1, (i) => List.generate(n + 1, (j) => 0));

    for (var i = 0; i <= m; i++) {
      d[i][0] = i;
    }

    for (var j = 0; j <= n; j++) {
      d[0][j] = j;
    }

    for (var j = 1; j <= n; j++) {
      for (var i = 1; i <= m; i++) {
        if (s1[i - 1] == s2[j - 1]) {
          d[i][j] = d[i - 1][j - 1];
        } else {
          d[i][j] = [
            d[i - 1][j] + 1,
            d[i][j - 1] + 1,
            d[i - 1][j - 1] + 1,
          ].reduce((value, element) => value < element ? value : element);
        }
      }
    }

    return d[m][n];
  }
}
