import 'package:json_annotation/json_annotation.dart';
part 'planet.g.dart';

@JsonSerializable(createToJson: false)
class Planet{
  final String name;
  @JsonKey(name: 'rotation_period')
  final String rotationPeriod;
  @JsonKey(name: 'orbital_period')
  final String orbitalPeriod;
  final String diameter;
  final String climate;
  final String gravity;
  final String terrain;
  @JsonKey(name: 'surface_water')
  final String surfaceWater;
  final String population;

  final String created;
  final String edited;
  final String url;

  @JsonKey(name: 'residents')
  final List<String> residents;
  @JsonKey(name: 'films')
  final List<String> films;

  Planet({
      required this.name,
      required this.rotationPeriod,
      required this.orbitalPeriod,
      required this.diameter,
      required this.climate,
      required this.gravity,
      required this.terrain,
      required this.surfaceWater,
      required this.population,
      required this.created,
      required this.edited,
      required this.url,
      required this.residents,
      required this.films});

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);
}