import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/film.dart';
import 'package:flutter/material.dart';

class FilmDetails extends StatelessWidget {
  final Film film;
  const FilmDetails({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Episode ID: ${film.episodeID}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Director: ${film.director}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Producer: ${film.producer}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Release date: ${film.releaseDate}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Opening Crawl: ${film.openingCrawl.substring(0, 100)}...', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
          ]
      ),
    );
  }
}