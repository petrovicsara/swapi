import 'package:json_annotation/json_annotation.dart';
part 'species.g.dart';

@JsonSerializable(createToJson: false)
class Species{
  final String name;
  final String classification;
  final String designation;
  final int average_height;
  final String skin_colors;
  final String hair_colors;
  final String eye_colors;
  final int average_lifespan;
  final String homeworld;
  final String language;

  final String created;
  final String edited;
  final String url;

  @JsonKey(name: 'people')
  final List<String> people;
  @JsonKey(name: 'films')
  final List films;

  Species({
    required this.name,
    required this.classification,
    required this.designation,
    required this.average_height,
    required this.skin_colors,
    required this.hair_colors,
    required this.eye_colors,
    required this.average_lifespan,
    required this.homeworld,
    required this.language,
    required this.created,
    required this.edited,
    required this.url,
    required this.people,
    required this.films});

  factory Species.fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);
}