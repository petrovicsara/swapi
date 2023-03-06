import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/person.dart';
import 'package:ending_wars/network/base_config.dart';
import 'package:flutter/material.dart';
import 'package:ending_wars/screens/person_screen.dart';

class PeopleListScreen extends StatelessWidget {
  const PeopleListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BaseConfig baseConfig = BaseConfig();
    List<dynamic> peopleList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.brightYellow,
        title: const Text('People'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                FutureBuilder(
                  future: baseConfig.getSpecificData('people', Person),
                    builder: (context, snapshot) {
                      if(snapshot.hasData) {
                        peopleList = snapshot.data!;
                        return Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: peopleList.length,
                                itemBuilder: (context, index) {
                                  Person person = peopleList[index];
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    shadowColor: Constants.lightGray,
                                    elevation: 5,
                                    color: Constants.lightGray,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PersonScreen(personID: index + 1, person: peopleList[index])));
                                      },
                                      child: ListTile(
                                        title: Text(person.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                        subtitle: Text(person.birthYear,),
                                        trailing: const Icon(Icons.arrow_forward_ios),
                                      ),
                                    ),
                                  );
                                }
                            )
                        );
                      } else if(snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return const Center(
                            child: CircularProgressIndicator(color: Constants.brightYellow,));
                      }
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
