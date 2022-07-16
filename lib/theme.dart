import 'package:flutter/material.dart';


MaterialColor PrimaryMaterialColor = MaterialColor(
  4294497289,
  <int, Color>{
    50: Color.fromRGBO(
      248,
      212,
      9,
      .1,
    ),
    100: Color.fromRGBO(
      248,
      212,
      9,
      .2,
    ),
    200: Color.fromRGBO(
      248,
      212,
      9,
      .3,
    ),
    300: Color.fromRGBO(
      248,
      212,
      9,
      .4,
    ),
    400: Color.fromRGBO(
      248,
      212,
      9,
      .5,
    ),
    500: Color.fromRGBO(
      248,
      212,
      9,
      .6,
    ),
    600: Color.fromRGBO(
      248,
      212,
      9,
      .7,
    ),
    700: Color.fromRGBO(
      248,
      212,
      9,
      .8,
    ),
    800: Color.fromRGBO(
      248,
      212,
      9,
      .9,
    ),
    900: Color.fromRGBO(
      248,
      212,
      9,
      1,
    ),
  },
);

ThemeData myTheme = ThemeData(
  fontFamily: "customFont",
  primaryColor: Color(0xfff8d409),


  primarySwatch: PrimaryMaterialColor,

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
        Color(0xfff8d409),
      ),
    ),
  ),
);
  