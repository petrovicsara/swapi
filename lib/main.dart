import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/models/root.dart';
import 'package:ending_wars/network/base_config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ending Wars',
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.colorToMaterialColor(Constants.brightYellow),
      ),
      home: const MyHomePage(title: 'My app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final BaseConfig baseConfig = BaseConfig();

  @override
  Widget build(BuildContext context) {
    Root root;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Center(
            child: FutureBuilder<Root>(
              future: baseConfig.getData(),
              builder: (context, snapshot) {
                if(snapshot.hasData) {
                  root = snapshot.data!;
                  return Row(
                    children: [
                      Expanded(
                          child: Card(
                            child: Text(
                              root.people
                            ),
                          ))
                    ],
                  );
                } else if(snapshot.hasError) {
                  return const Center(
                    child: Text(
                      'Error has occurred!'
                    ),
                  );
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(height: 50,)
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
