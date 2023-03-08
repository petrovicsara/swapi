// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Film _$FilmFromJson(Map<String, dynamic> json) => Film(
      name: json['title'] as String,
      episodeID: json['episode_id'] as int,
      openingCrawl: json['opening_crawl'] as String,
      director: json['director'] as String,
      producer: json['producer'] as String,
      releaseDate: json['release_date'] as String,
      created: json['created'] as String,
      edited: json['edited'] as String,
      url: json['url'] as String,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      planets:
          (json['planets'] as List<dynamic>).map((e) => e as String).toList(),
      starships:
          (json['starships'] as List<dynamic>).map((e) => e as String).toList(),
      vehicles:
          (json['vehicles'] as List<dynamic>).map((e) => e as String).toList(),
      species:
          (json['species'] as List<dynamic>).map((e) => e as String).toList(),
    );