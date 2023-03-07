import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/network/base_config.dart';
import 'package:ending_wars/screens/film_screen.dart';
import 'package:ending_wars/screens/person_screen.dart';
import 'package:ending_wars/screens/planet_screen.dart';
import 'package:ending_wars/screens/species_screen.dart';
import 'package:ending_wars/screens/starship_screen.dart';
import 'package:ending_wars/screens/vehicle_screen.dart';
import 'package:flutter/material.dart';

class ResourceListScreen extends StatelessWidget {
  final String resourceNameType;
  const ResourceListScreen({Key? key, required this.resourceNameType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BaseConfig baseConfig = BaseConfig();
    List<dynamic> resourceList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.brightYellow,
        title: Text(Constants.capitalize(resourceNameType)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              FutureBuilder(
                  future: baseConfig.getSpecificData(resourceNameType),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      resourceList = snapshot.data!;
                      return Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: resourceList.length,
                            itemBuilder: (context, index) {
                              var resource = resourceList[index];
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadowColor: Constants.lightGray,
                                elevation: 5,
                                color: Constants.lightGray,
                                child: InkWell(
                                  onTap: () {
                                    dynamic nextScreen;
                                    switch (resourceNameType) {
                                      case 'people':
                                        nextScreen = PersonScreen(
                                          personID: index + 1,
                                          person: resourceList[index],
                                        );
                                        break;
                                      case 'planets':
                                        nextScreen = PlanetScreen(
                                            planetID: index + 1,
                                            planet: resourceList[index]);
                                        break;
                                      case 'films':
                                        nextScreen = FilmScreen(
                                            filmID: index + 1,
                                            film: resourceList[index]);
                                        break;
                                      case 'species':
                                        nextScreen = SpeciesScreen(
                                            speciesID: index + 1,
                                            species: resourceList[index]);
                                        break;
                                      case 'vehicles':
                                        nextScreen = VehicleScreen(
                                            vehicleID: index + 1,
                                            vehicle: resourceList[index]);
                                        break;
                                      case 'starships':
                                        nextScreen = StarshipScreen(
                                            starshipID: index + 1,
                                            starship: resourceList[index]);
                                        break;
                                    }

                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => nextScreen));
                                  },
                                  child: ListTile(
                                    title: Text(
                                      resource.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    subtitle: const Text('Get to know more..'),
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                  ),
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Constants.brightYellow,
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
