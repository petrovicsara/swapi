import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleDetails extends StatelessWidget {
  final Vehicle vehicle;
  const VehicleDetails({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height / 4,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Model: ${vehicle.model}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Class: ${vehicle.vehicleClass}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Manufacturer: ${vehicle.manufacturer}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Length: ${vehicle.length}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
            const Spacer(),
            Text('Passengers: ${vehicle.passengers}', style: const TextStyle(color: Constants.brightYellow, fontSize: 15),),
          ]
      ),
    );
  }
}