import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/planet.dart';
import 'package:ending_wars/widgets/nested_data_widget.dart';
import 'package:ending_wars/widgets/planet_details_widget.dart';
import 'package:flutter/material.dart';

class PlanetScreen extends StatelessWidget {
  final int planetID;
  final Planet planet;
  const PlanetScreen({Key? key, required this.planetID, required this.planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(planet.name),
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
                      child: PlanetDetails(planet: planet,),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Residents',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Constants.lightGray),
                ),
                const SizedBox(height: 20,),
                NestedData(resourceName: 'people', resourceEndpoints: planet.residents,),
                const SizedBox(height: 20,),
                const Text(
                  'Films',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Constants.lightGray),
                ),
                const SizedBox(height: 20,),
                NestedData(resourceName: 'films', resourceEndpoints: planet.films,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
