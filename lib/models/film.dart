import 'package:json_annotation/json_annotation.dart';

part 'film.g.dart';

@JsonSerializable()
class Film {
  final String title;
  @JsonKey(name: 'episode_id')
  final int episodeID;
  @JsonKey(name: 'opening_crawl')
  final String openingCrawl;
  final String director;
  final String producer;
  @JsonKey(name: 'release_date')
  final String releaseDate;

  final String created;
  final String edited;
  final String url;

  final List<String> characters;
  final List<String> planets;
  final List<String> starships;
  final List<String> vehicles;
  final List<String> species;

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