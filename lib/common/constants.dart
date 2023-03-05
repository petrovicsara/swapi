import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  //color schema
  static const darkBlue = Color(0xFF0A2342); // space
  static const brightYellow = Color(0xFFF5B41B); // lightsabers of the Jedi
  static const brightYellow2 = Color(0xFFA37710); // lightsabers of the Jedi tryout
  static const brightRed = Color(0xFFD20000); // the Sith and dark side of the Force
  static const lightGray = Color(0xFFF5F5F5); // the Rebel Alliance
  static const lightGray2 = Color(0x99F5F5F5); // the Rebel Alliance
  static const darkGray = Color(0xFF333333); // contrast with other colors

  //Color to MaterialColor
  static colorToMaterialColor(Color color){
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }

}
