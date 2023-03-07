// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vehicle _$VehicleFromJson(Map<String, dynamic> json) => Vehicle(
      name: json['name'] as String,
      model: json['model'] as String,
      manufacturer: json['manufacturer'] as String,
      costInCredits: json['cost_in_credits'] as String,
      length: json['length'] as String,
      maxAtmospheringSpeed: json['max_atmosphering_speed'] as String,
      crew: json['crew'] as String,
      passengers: json['passengers'] as String,
      cargoCapacity: json['cargo_capacity'] as String,
      consumables: json['consumables'] as String,
      vehicleClass: json['vehicle_class'] as String,
      pilots: json['pilots'] as List<dynamic>,
      created: json['created'] as String,
      edited: json['edited'] as String,
      url: json['url'] as String,
      films: (json['films'] as List<dynamic>).map((e) => e as String).toList(),
    );
