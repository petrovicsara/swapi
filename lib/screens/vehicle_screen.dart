import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/vehicle.dart';
import 'package:ending_wars/widgets/nested_data_widget.dart';
import 'package:ending_wars/widgets/vehicle_details_widget.dart';
import 'package:flutter/material.dart';

class VehicleScreen extends StatelessWidget {
  final int vehicleID;
  final Vehicle vehicle;
  const VehicleScreen({Key? key, required this.vehicleID, required this.vehicle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vehicle.name),
        backgroundColor: Constants.brightYellow,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Card(
                    color: Constants.darkBlue,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Constants.lightGray,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: VehicleDetails(
                        vehicle: vehicle,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text(
                  'Films',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Constants.lightGray),
                ),
                const SizedBox(height: 20,),
                NestedData(resourceName: 'films', resourceEndpoints: vehicle.films),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
