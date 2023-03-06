import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/planet.dart';
import 'package:flutter/material.dart';

class PlanetDetails extends StatelessWidget {
  final Planet planet;
  const PlanetDetails({Key? key, required this.planet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Diameter: ${planet.diameter}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Rotation and orbital period: ${planet.rotationPeriod} & ${planet.orbitalPeriod}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Gravity: ${planet.gravity}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Climate: ${planet.climate}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Surface Water: ${planet.surfaceWater}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
          ]
      ),
    );
  }
}
