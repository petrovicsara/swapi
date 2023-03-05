import 'package:json_annotation/json_annotation.dart';
part 'planet.g.dart';

@JsonSerializable(createToJson: false)
class Planet{
  final String name;
  final int rotation_period;
  final int orbital_period;
  final int diameter;
  final String climate;
  final String gravity;
  final String terrain;
  final int surface_water;
  final int population;

  final String created;
  final String edited;
  final String url;

  @JsonKey(name: 'residents')
  final List<String> residents;
  @JsonKey(name: 'films')
  final List films;

  Planet({
      required this.name,
      required this.rotation_period,
      required this.orbital_period,
      required this.diameter,
      required this.climate,
      required this.gravity,
      required this.terrain,
      required this.surface_water,
      required this.population,
      required this.created,
      required this.edited,
      required this.url,
      required this.residents,
      required this.films});

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);
}