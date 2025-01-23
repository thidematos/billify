import 'package:billify/themes/color_theme.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/logo.png',
          height: 40,
        ),
        const SizedBox(width: 10),
        Text(
          'BILL',
          style: TypographyTheme.logo.copyWith(
            color: ColorTheme.black,
          ),
        ),
        Text(
          'IFY',
          style: TypographyTheme.logo.copyWith(color: ColorTheme.mainBlue),
        ),
      ],
    );
  }
}
