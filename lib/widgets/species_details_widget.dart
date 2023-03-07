import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/species.dart';
import 'package:flutter/material.dart';

class SpeciesDetails extends StatelessWidget {
  final Species species;
  const SpeciesDetails({Key? key, required this.species}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Classification: ${species.classification}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Designation: ${species.designation}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Average height: ${species.averageHeight}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Average life span: ${species.averageLifespan}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Language: ${species.language}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
          ]
      ),
    );
  }
}