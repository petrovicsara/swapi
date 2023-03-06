// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Planet _$PlanetFromJson(Map<String, dynamic> json) => Planet(
      name: json['name'] as String,
      rotationPeriod: json['rotation_period'] as String,
      orbitalPeriod: json['orbital_period'] as String,
      diameter: json['diameter'] as String,
      climate: json['climate'] as String,
      gravity: json['gravity'] as String,
      terrain: json['terrain'] as String,
      surfaceWater: json['surface_water'] as String,
      population: json['population'] as String,
      created: json['created'] as String,
      edited: json['edited'] as String,
      url: json['url'] as String,
      residents:
          (json['residents'] as List<dynamic>).map((e) => e as String).toList(),
      films: (json['films'] as List<dynamic>).map((e) => e as String).toList(),
    );
