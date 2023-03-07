import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/network/base_config.dart';
import 'package:ending_wars/widgets/card_root_resources_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BaseConfig baseConfig = BaseConfig();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> root;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Center(
            child: Column(children: [
              Image.asset(
                'assets/star_wars_logo.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: baseConfig.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    root = snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: root.length,
                        itemBuilder: (context, index) {
                          final key = root.keys.elementAt(index);
                          final value = root[key];
                          return CardRootResources(resourceNameType: key, resourceStringUrl: value!);
                        },
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator(
                      color: Constants.brightYellow,
                    );
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
