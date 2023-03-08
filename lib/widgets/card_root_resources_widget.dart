import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/common/util.dart';
import 'package:ending_wars/screens/resource_list_screen.dart';
import 'package:flutter/material.dart';

class CardRootResources extends StatelessWidget {
  final String resourceNameType;
  final String resourceStringUrl;

  const CardRootResources({Key? key, required this.resourceNameType, required this.resourceStringUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Constants.lightGray,
      shadowColor: Constants.darkGray,
      elevation: 20,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResourceListScreen(resourceNameType: resourceNameType)));
        },
        child: ListTile(
          title: Text(
            capitalize(resourceNameType),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text(resourceStringUrl),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
