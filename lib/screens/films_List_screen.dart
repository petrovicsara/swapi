import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/film.dart';
import 'package:ending_wars/network/base_config.dart';
import 'package:ending_wars/screens/film_screen.dart';
import 'package:flutter/material.dart';

class FilmsListScreen extends StatelessWidget {
  const FilmsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BaseConfig baseConfig = BaseConfig();
    List<dynamic> filmsList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.brightYellow,
        title: const Text('Films'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
          children: [
          const SizedBox(
            height: 50,
          ),
          FutureBuilder<List<Film>>(
              future: baseConfig.getSpecificData('films', Film),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  filmsList = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: filmsList.length,
                        itemBuilder: (context, index) {
                          Film film = filmsList[index];
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadowColor: Constants.lightGray,
                            elevation: 5,
                            color: Constants.lightGray,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => FilmScreen(filmID: index + 1, film: filmsList[index],)));
                              },
                              child: ListTile(
                                  title: Text(film.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                  subtitle: Text(film.director),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator(
                    color: Constants.darkBlue,
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
