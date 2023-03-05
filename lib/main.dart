import 'package:ending_wars/common/constants.dart';
import 'package:ending_wars/screens/home_screen.dart';
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
        scaffoldBackgroundColor:
            Constants.colorToMaterialColor(Constants.darkBlue),
      ),
      home: const HomeScreen(),
    );
  }
}
