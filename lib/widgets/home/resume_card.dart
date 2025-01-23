import 'package:billify/providers/bills_provider.dart';
import 'package:billify/themes/color_theme.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResumeCard extends StatelessWidget {
  const ResumeCard(this.label, this.icon, this.amount, {super.key});

  final String label;
  final IconData icon;
  final double amount;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(
      child: Card(
        color: ColorTheme.mainBlue,
        child: Container(
          padding: const EdgeInsets.all(12),
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 6,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TypographyTheme.body.copyWith(
                      color: ColorTheme.mainWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'R\$ ${amount.toStringAsFixed(2)}',
                    style: TypographyTheme.body.copyWith(
                      color: ColorTheme.mainWhite,
                    ),
                  )
                ],
              ),
              Icon(
                icon,
                size: 32,
                color: ColorTheme.mainWhite,
              )
            ],
          ),
        ),
      ),
    );
  }
}
