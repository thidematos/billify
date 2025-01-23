import 'package:billify/data/categories_with_icons.dart';
import 'package:billify/data/enums.dart';
import 'package:billify/themes/color_theme.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:billify/utils/formatDate.dart';
import 'package:flutter/material.dart';

class ToBePaidCard extends StatelessWidget {
  const ToBePaidCard(this.bill, {super.key});

  final Map bill;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now().toLocal();
    final daysToExpire = DateTime.fromMillisecondsSinceEpoch(
            bill['vencimento'] - now.millisecondsSinceEpoch)
        .day;
    Color iconColor = ColorTheme.errorRed;

    if (daysToExpire <= 7 && daysToExpire > 3) {
      iconColor = ColorTheme.tertiaryBlue;
    }

    if (daysToExpire <= 3 && daysToExpire > 1) {
      iconColor = ColorTheme.dangerYellow;
    }

    return Container(
      width: 125,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Card(
        child: Column(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              bill['conta'],
              style: TypographyTheme.body.copyWith(
                fontSize: 14,
              ),
            ),
            Icon(
              categoriesWithIcons[bill['categoria']],
              size: 36,
              color: iconColor,
              shadows: [
                Shadow(
                    blurRadius: 2,
                    offset: Offset(4, 3),
                    color: const Color.fromARGB(18, 120, 120, 120))
              ],
            ),
            Text(
              '${daysToExpire.toString()} dias'.toUpperCase(),
              style: TypographyTheme.body.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
