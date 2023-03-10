import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable(createToJson: false)
class Person{
  final String name;
  final String height;
  final String mass;
  @JsonKey(name: 'hair_color')
  final String hairColor;
  @JsonKey(name: 'skin_color')
  final String skinColor;
  @JsonKey(name: 'eye_color')
  final String eyeColor;
  @JsonKey(name: 'birth_year')
  final String birthYear;
  final String gender;
  final String homeworld;

  final String created;
  final String edited;
  final String url;

  @JsonKey(name: 'films')
  final List<String> films;
  @JsonKey(name: 'species')
  final List species;
  @JsonKey(name: 'vehicles')
  final List<String> vehicles;
  @JsonKey(name: 'starships')
  final List<String> starships;

  Person({
      required this.name,
      required this.height,
      required this.mass,
      required this.hairColor,
      required this.skinColor,
      required this.eyeColor,
      required this.birthYear,
      required this.gender,
      required this.homeworld,
      required this.created,
      required this.edited,
      required this.url,
      required this.films,
      required this.species,
      required this.vehicles,
      required this.starships});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
}