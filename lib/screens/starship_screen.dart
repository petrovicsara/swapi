import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/starship.dart';
import 'package:ending_wars/widgets/nested_data_widget.dart';
import 'package:ending_wars/widgets/starship_details_widget.dart';
import 'package:flutter/material.dart';

class StarshipScreen extends StatelessWidget {
  final int starshipID;
  final Starship starship;
  const StarshipScreen({Key? key, required this.starshipID, required this.starship})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(starship.name),
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
                      child: StarshipDetails(
                        starship: starship,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Films',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Constants.lightGray),
                ),
                const SizedBox(
                  height: 20,
                ),
                NestedData(
                  resourceName: 'films',
                  resourceEndpoints: starship.films,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
