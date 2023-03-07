import 'package:json_annotation/json_annotation.dart';
part 'vehicle.g.dart';

@JsonSerializable(createToJson: false)
class Vehicle{
  final String name;
  final String model;
  final String manufacturer;
  @JsonKey(name: 'cost_in_credits')
  final String costInCredits;
  final String length;
  @JsonKey(name: 'max_atmosphering_speed')
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  @JsonKey(name: 'cargo_capacity')
  final String cargoCapacity;
  final String consumables;
  @JsonKey(name: 'vehicle_class')
  final String vehicleClass;
  final List pilots;


  final String created;
  final String edited;
  final String url;

  @JsonKey(name: 'films')
  final List<String> films;

  Vehicle({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.crew,
    required this.passengers,
    required this.cargoCapacity,
    required this.consumables,
    required this.vehicleClass,
    required this.pilots,
    required this.created,
    required this.edited,
    required this.url,
    required this.films});

  factory Vehicle.fromJson(Map<String, dynamic> json) => _$VehicleFromJson(json);
}