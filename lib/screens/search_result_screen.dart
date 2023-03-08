import 'package:ending_wars/common/util.dart';
import 'package:ending_wars/network/base_config.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends StatelessWidget {
  final String resourceNameType;
  final String searchResult;

  const SearchResultScreen(
      {Key? key, required this.resourceNameType, required this.searchResult})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    BaseConfig baseConfig = BaseConfig();

    return FutureBuilder(
        future: baseConfig.getSpecificData(resourceNameType, searchResult),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return getResourceScreen(resourceNameType, snapshot.data!);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
