// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Species _$SpeciesFromJson(Map<String, dynamic> json) => Species(
      name: json['name'] as String,
      classification: json['classification'] as String,
      designation: json['designation'] as String,
      average_height: json['average_height'] as int,
      skin_colors: json['skin_colors'] as String,
      hair_colors: json['hair_colors'] as String,
      eye_colors: json['eye_colors'] as String,
      average_lifespan: json['average_lifespan'] as int,
      homeworld: json['homeworld'] as String,
      language: json['language'] as String,
      created: json['created'] as String,
      edited: json['edited'] as String,
      url: json['url'] as String,
      people:
          (json['people'] as List<dynamic>).map((e) => e as String).toList(),
      films: json['films'] as List<dynamic>,
    );
