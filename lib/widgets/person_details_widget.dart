import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/person.dart';
import 'package:flutter/material.dart';

class PersonDetails extends StatelessWidget {
  final Person person;
  const PersonDetails({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height / 4,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Birth year: ${person.birthYear}',
          style: const TextStyle(color: Constants.brightYellow, fontSize: 15),
        ),
        const Spacer(),
        Text(
          'Gender: ${person.gender}',
          style: const TextStyle(color: Constants.brightYellow, fontSize: 15),
        ),
        const Spacer(),
        Text(
          'Eye color: ${person.eyeColor}',
          style: const TextStyle(color: Constants.brightYellow, fontSize: 15),
        ),
        const Spacer(),
        Text(
          'Hair color: ${person.hairColor}',
          style: const TextStyle(color: Constants.brightYellow, fontSize: 15),
        ),
        const Spacer(),
        Text(
          'Height and mass: ${person.height} & ${person.mass}',
          style: const TextStyle(color: Constants.brightYellow, fontSize: 15),
        ),
        const Spacer(),
        Text(
          'Skin color: ${person.skinColor}',
          style: const TextStyle(color: Constants.brightYellow, fontSize: 15),
        ),
      ]),
    );
  }
}
