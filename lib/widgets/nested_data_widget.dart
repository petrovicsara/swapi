import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/network/base_config.dart';
import 'package:flutter/material.dart';

class NestedData extends StatelessWidget {
  final String resourceName;
  final List<String> resourceEndpoints;
  const NestedData(
      {Key? key, required this.resourceName, required this.resourceEndpoints})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BaseConfig baseConfig = BaseConfig();
    List<String> dataList;

    return SingleChildScrollView(
      child: Column(
        children: [
          FutureBuilder(
              future:
                  baseConfig.getNestedData(resourceName, resourceEndpoints),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  dataList = snapshot.data!;

                  return Text( dataList.toString() , style: const TextStyle(color: Constants.brightYellow, fontSize: 15),);
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator(
                    color: Constants.brightYellow,
                  );
                }
              })
        ],
      ),
    );
  }
}
