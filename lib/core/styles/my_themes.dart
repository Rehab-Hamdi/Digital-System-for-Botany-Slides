import 'package:flutter/material.dart';
import 'package:Botany/core/styles/colors.dart';

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
      headline3: TextStyle(
        color: MyColors.lightBlack2,
        fontWeight: FontWeight.w800,
        fontSize: 13,
      ),
      headline4: TextStyle(
          color: MyColors.lightBlack2,
          fontSize: 18,
          fontWeight: FontWeight.bold
      ),
      headline5: TextStyle(
          color: Colors.grey,
          fontSize: 12,
          fontWeight: FontWeight.normal
      ),
      headline6: TextStyle(
          color: MyColors.userInfoColor,
          fontSize: 16,
          fontWeight: FontWeight.bold
      ),
    ),
  );
}