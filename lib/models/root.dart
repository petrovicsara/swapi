import 'package:json_annotation/json_annotation.dart';
part 'root.g.dart';

@JsonSerializable(createToJson: false)
class Root {
  final String people;
  final String planets;
  final String films;
  final String species;
  final String vehicles;
  final String starships;

  Root({
      required this.people,
      required this.planets,
      required this.films,
      required this.species,
      required this.vehicles,
      required this.starships});

  factory Root.fromJson(Map<String, dynamic> json) => _$RootFromJson(json);
}