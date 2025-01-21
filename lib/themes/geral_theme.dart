import 'package:billify/themes/color_theme.dart';
import 'package:flutter/material.dart';

final ThemeData kGeralTheme = ThemeData().copyWith(
  iconTheme: IconThemeData().copyWith(
    shadows: [
      Shadow(color: ColorTheme.black, offset: Offset(3, 5), blurRadius: 50),
    ],
  ),
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
  appBarTheme: AppBarTheme().copyWith(
    elevation: 50,
    toolbarHeight: 100,
    backgroundColor: ColorTheme.mainWhite,
  ),
);
