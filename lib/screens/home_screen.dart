import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/root.dart';
import 'package:ending_wars/network/base_config.dart';
import 'package:ending_wars/screens/films_List_screen.dart';
import 'package:ending_wars/widgets/card_root_resources.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BaseConfig baseConfig = BaseConfig();

  @override
  Widget build(BuildContext context) {
    Root root;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Center(
            child: Column(children: [
              Image.asset(
                'assets/star_wars_logo.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder<Root>(
                future: baseConfig.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    root = snapshot.data!;
                    return Expanded(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          CardRootResources(
                              title: 'Films', subtitle: root.films, nextScreen: const FilmsListScreen(), ),
                          CardRootResources(
                              title: 'People', subtitle: root.people, nextScreen: const FilmsListScreen(),),
                          CardRootResources(
                              title: 'Planets', subtitle: root.planets, nextScreen: const FilmsListScreen(),),
                          CardRootResources(
                              title: 'Species', subtitle: root.species, nextScreen: const FilmsListScreen(),),
                          CardRootResources(
                              title: 'Starships', subtitle: root.starships, nextScreen: const FilmsListScreen(),),
                          CardRootResources(
                              title: 'Vehicles', subtitle: root.vehicles, nextScreen: const FilmsListScreen(),),
                        ],
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator(
                      color: Constants.darkBlue,
                    );
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
