import 'package:json_annotation/json_annotation.dart';

part 'film.g.dart';

@JsonSerializable(createToJson: false)
class Film {
  @JsonKey(defaultValue: 'Unknown')
  final String title;
  final int episodeID;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;

  final String created;
  final String edited;
  final String url;

  @JsonKey(name: 'characters')
  final List<String> characters;
  @JsonKey(name: 'planets')
  final List<String> planets;
  @JsonKey(name: 'starships')
  final List<String> starships;
  @JsonKey(name: 'vehicles')
  final List<String> vehicles;
  @JsonKey(name: 'species')
  final List species;

  Film(
      { required this.title,
        required this.episodeID,
        required this.openingCrawl,
        required this.director,
        required this.producer,
        required this.releaseDate,
        required this.created,
        required this.edited,
        required this.url,
        required this.characters,
        required this.planets,
        required this.starships,
        required this.vehicles,
        required this.species
      });

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);

}