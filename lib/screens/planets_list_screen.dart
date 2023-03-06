import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/planet.dart';
import 'package:ending_wars/network/base_config.dart';
import 'package:ending_wars/screens/planet_screen.dart';
import 'package:flutter/material.dart';

class PlanetsListScreen extends StatelessWidget {
  const PlanetsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BaseConfig baseConfig = BaseConfig();
    List<dynamic> planetsList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.brightYellow,
        title: const Text('Planets'),
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
                  future: baseConfig.getSpecificData('planets', Planet),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      planetsList = snapshot.data!;
                      return Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: planetsList.length,
                            itemBuilder: (context, index) {
                              Planet planet = planetsList[index];
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                shadowColor: Constants.lightGray,
                                elevation: 5,
                                color: Constants.lightGray,
                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlanetScreen(planetID: index + 1, planet: planetsList[index],)));
                                  },
                                  child: ListTile(
                                    title: Text(planet.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                    subtitle: Text(planet.climate),
                                    trailing: const Icon(Icons.arrow_forward_ios),
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
