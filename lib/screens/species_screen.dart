import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/species.dart';
import 'package:ending_wars/widgets/nested_data_widget.dart';
import 'package:ending_wars/widgets/species_details_widget.dart';
import 'package:flutter/material.dart';

class SpeciesScreen extends StatelessWidget {
  final Species species;
  const SpeciesScreen({Key? key, required this.species})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(species.name),
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
                      child: SpeciesDetails(
                        species: species,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'People',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Constants.lightGray),
                ),
                const SizedBox(
                  height: 20,
                ),
                NestedData(resourceName: 'people', resourceEndpoints: species.people,),
                const SizedBox(height: 20,),
                const Text(
                  'Films',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Constants.lightGray),
                ),
                const SizedBox(height: 20,),
                NestedData(resourceName: 'films', resourceEndpoints: species.films),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
