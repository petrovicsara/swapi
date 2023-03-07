import 'package:json_annotation/json_annotation.dart';
part 'starship.g.dart';

@JsonSerializable(createToJson: false)
class Starship{
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
  @JsonKey(name: 'hyperdrive_rating')
  final String hyperdriveRating;
  @JsonKey(name: 'MGLT')
  final String mglt;
  @JsonKey(name: 'starship_class')
  final String starshipClass;
  final List pilots;


  final String created;
  final String edited;
  final String url;

  @JsonKey(name: 'films')
  final List films;

  Starship({
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
    required this.hyperdriveRating,
    required this.mglt,
    required this.starshipClass,
    required this.pilots,
    required this.created,
    required this.edited,
    required this.url,
    required this.films});

  factory Starship.fromJson(Map<String, dynamic> json) => _$StarshipFromJson(json);
}