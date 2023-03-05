// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'starship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Starship _$StarshipFromJson(Map<String, dynamic> json) => Starship(
      name: json['name'] as String,
      model: json['model'] as String,
      manufacturer: json['manufacturer'] as String,
      cost_in_credits: json['cost_in_credits'] as int,
      length: json['length'] as int,
      max_atmosphering_speed: json['max_atmosphering_speed'] as int,
      crew: json['crew'] as String,
      passengers: json['passengers'] as int,
      cargo_capacity: json['cargo_capacity'] as int,
      consumables: json['consumables'] as String,
      hyperdrive_rating: (json['hyperdrive_rating'] as num).toDouble(),
      MGLT: json['MGLT'] as int,
      starship_class: json['starship_class'] as String,
      pilots: json['pilots'] as List<dynamic>,
      created: json['created'] as String,
      edited: json['edited'] as String,
      url: json['url'] as String,
      films: json['films'] as List<dynamic>,
    );
