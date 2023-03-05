import 'package:json_annotation/json_annotation.dart';
part 'starship.g.dart';

@JsonSerializable(createToJson: false)
class Starship{
  final String name;
  final String model;
  final String manufacturer;
  final int cost_in_credits;
  final int length;
  final int max_atmosphering_speed;
  final String crew;
  final int passengers;
  final int cargo_capacity;
  final String consumables;
  final double hyperdrive_rating;
  final int MGLT;
  final String starship_class;
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
    required this.cost_in_credits,
    required this.length,
    required this.max_atmosphering_speed,
    required this.crew,
    required this.passengers,
    required this.cargo_capacity,
    required this.consumables,
    required this.hyperdrive_rating,
    required this.MGLT,
    required this.starship_class,
    required this.pilots,
    required this.created,
    required this.edited,
    required this.url,
    required this.films});

  factory Starship.fromJson(Map<String, dynamic> json) => _$StarshipFromJson(json);
}