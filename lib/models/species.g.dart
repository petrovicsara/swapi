// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Species _$SpeciesFromJson(Map<String, dynamic> json) => Species(
      name: json['name'] as String,
      classification: json['classification'] as String,
      designation: json['designation'] as String,
      averageHeight: json['average_height'] as String,
      skinColors: json['skin_colors'] as String?,
      hairColors: json['hair_colors'] as String?,
      eyeColors: json['eye_colors'] as String?,
      averageLifespan: json['average_lifespan'] as String,
      homeworld: json['homeworld'] as String?,
      language: json['language'] as String,
      created: json['created'] as String,
      edited: json['edited'] as String,
      url: json['url'] as String,
      people:
          (json['people'] as List<dynamic>).map((e) => e as String).toList(),
      films: (json['films'] as List<dynamic>).map((e) => e as String).toList(),
    );
