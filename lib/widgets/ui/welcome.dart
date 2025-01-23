import 'package:billify/themes/color_theme.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final int now = DateTime.now().toLocal().hour;
    final Map<String, String> saudations = {
      'manha': 'Bom dia',
      'tarde': 'Boa tarde',
      'noite': 'Boa noite'
    };

    Map<String, IconData> icons = {
      'manha': Icons.wb_sunny_outlined,
      'tarde': Icons.wb_twilight_outlined,
      'noite': Icons.nightlight_outlined,
    };

    String curSaudation = saudations['manha']!;
    IconData curIcon = icons['manha']!;

    if (now >= 6 && now <= 12) {
      curSaudation = saudations['manha']!;
      curIcon = icons['manha']!;
    }

    if (now > 12 && now <= 18) {
      curSaudation = saudations['tarde']!;
      curIcon = icons['tarde']!;
    }

    if (now > 18 && now < 6) {
      curSaudation = saudations['noite']!;
      curIcon = icons['noite']!;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Row(
          spacing: 12,
          children: [
            Text(
              '$curSaudation, Thiago',
              style: TypographyTheme.homeTitle,
            ),
            Icon(
              curIcon,
              shadows: [
                Shadow(
                    color: ColorTheme.borderBlack,
                    offset: Offset(2, 2),
                    blurRadius: 20)
              ],
              size: 28,
            ),
          ],
        )),
        Icon(
          Icons.notifications_outlined,
          size: 28,
        ),
      ],
    );
  }
}
