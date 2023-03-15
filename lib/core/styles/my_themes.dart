import 'package:flutter/material.dart';
import 'package:our_test_project/core/styles/colors.dart';

class MyThemeData{
  static final ThemeData themeData = ThemeData(
    textTheme: const TextTheme(
      headline1: TextStyle(
          color: MyColors.darkGray,
          fontSize: 35,
          fontWeight: FontWeight.normal),
      headline2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}