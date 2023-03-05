// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Planet _$PlanetFromJson(Map<String, dynamic> json) => Planet(
      name: json['name'] as String,
      rotation_period: json['rotation_period'] as int,
      orbital_period: json['orbital_period'] as int,
      diameter: json['diameter'] as int,
      climate: json['climate'] as String,
      gravity: json['gravity'] as String,
      terrain: json['terrain'] as String,
      surface_water: json['surface_water'] as int,
      population: json['population'] as int,
      created: json['created'] as String,
      edited: json['edited'] as String,
      url: json['url'] as String,
      residents:
          (json['residents'] as List<dynamic>).map((e) => e as String).toList(),
      films: json['films'] as List<dynamic>,
    );
