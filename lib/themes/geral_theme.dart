import 'package:billify/themes/color_theme.dart';
import 'package:flutter/material.dart';

final ThemeData kGeralTheme = ThemeData().copyWith(
  scaffoldBackgroundColor: ColorTheme.secondaryWhite,
  iconTheme: IconThemeData().copyWith(),
  inputDecorationTheme: InputDecorationTheme().copyWith(
    //contentPadding: const EdgeInsets.all(2),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: ColorTheme.borderBlack,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: ColorTheme.borderBlack,
      ),
    ),
  ),
  cardTheme: CardTheme().copyWith(
    color: const Color.fromARGB(255, 249, 249, 249),
  ),
  appBarTheme: AppBarTheme().copyWith(
    toolbarHeight: 75,
    backgroundColor: ColorTheme.secondaryWhite,
  ),
);
