// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
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
      vehicle_class: (json['vehicle_class'] as num).toDouble(),
      pilots: json['pilots'] as List<dynamic>,
      created: json['created'] as String,
      edited: json['edited'] as String,
      url: json['url'] as String,
      films: json['films'] as List<dynamic>,
    );
