import 'package:ending_wars/common/constants.dart';
import 'package:flutter/material.dart';

class CardRootResources extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget nextScreen;

  const CardRootResources(
      {Key? key, required this.title, required this.subtitle, required this.nextScreen})
      : super(key: key);

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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => nextScreen));
        },
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
