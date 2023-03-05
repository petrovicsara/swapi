// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      name: json['name'] as String,
      height: json['height'] as int,
      mass: json['mass'] as int,
      hair_color: json['hair_color'] as String,
      skin_color: json['skin_color'] as String,
      eye_color: json['eye_color'] as String,
      birth_year: json['birth_year'] as String,
      gender: json['gender'] as String,
      homeworld: json['homeworld'] as String,
      created: json['created'] as String,
      edited: json['edited'] as String,
      url: json['url'] as String,
      films: (json['films'] as List<dynamic>).map((e) => e as String).toList(),
      species: json['species'] as List<dynamic>,
      vehicles:
          (json['vehicles'] as List<dynamic>).map((e) => e as String).toList(),
      starships:
          (json['starships'] as List<dynamic>).map((e) => e as String).toList(),
    );
