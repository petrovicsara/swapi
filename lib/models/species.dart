import 'package:json_annotation/json_annotation.dart';
part 'species.g.dart';

@JsonSerializable(createToJson: false)
class Species{
  final String name;
  final String classification;
  final String designation;
  @JsonKey(name: 'average_height')
  final String averageHeight;
  @JsonKey(name: 'skin_colors')
  final String skinColors;
  @JsonKey(name: 'hair_colors')
  final String hairColors;
  @JsonKey(name: 'eye_colors')
  final String eyeColors;
  @JsonKey(name: 'average_lifespan')
  final String averageLifespan;
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
    required this.averageHeight,
    required this.skinColors,
    required this.hairColors,
    required this.eyeColors,
    required this.averageLifespan,
    required this.homeworld,
    required this.language,
    required this.created,
    required this.edited,
    required this.url,
    required this.people,
    required this.films});

  factory Species.fromJson(Map<String, dynamic> json) => _$SpeciesFromJson(json);
}