import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/film.dart';
import 'package:ending_wars/widgets/film_details_widget.dart';
import 'package:ending_wars/widgets/nested_data_widget.dart';
import 'package:flutter/material.dart';

class FilmScreen extends StatelessWidget {
  final int filmID;
  final Film film;
  const FilmScreen({Key? key, required this.filmID, required this.film})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.name),
        backgroundColor: Constants.brightYellow,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Card(
                    color: Constants.darkBlue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Constants.lightGray,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: FilmDetails(
                        film: film,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Planets',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Constants.lightGray),
                ),
                const SizedBox(
                  height: 20,
                ),
                NestedData(
                  resourceName: 'planets',
                  resourceEndpoints: film.planets,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Vehicles',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Constants.lightGray),
                ),
                const SizedBox(
                  height: 20,
                ),
                NestedData(
                    resourceName: 'vehicles', resourceEndpoints: film.vehicles),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
