import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/starship.dart';
import 'package:flutter/material.dart';

class StarshipDetails extends StatelessWidget {
  final Starship starship;
  const StarshipDetails({Key? key, required this.starship}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Model: ${starship.model}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Manufacturer: ${starship.manufacturer}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Class: ${starship.starshipClass}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Cost in credits: ${starship.costInCredits}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Passengers: ${starship.passengers}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
          ]
      ),
    );
  }
}