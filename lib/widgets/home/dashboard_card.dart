import 'package:billify/themes/color_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard(this.bills, {super.key});

  final List bills;

  @override
  Widget build(BuildContext context) {
    final Set<String> categories =
        bills.map((bill) => bill['categoria'] as String).toSet();

    Map<String, double> values = {};

    for (final category in categories) {
      final List selectedBills =
          bills.where((bill) => bill['categoria'] == category).toList();

      double totalCurCategory = 0.0;

      for (final selected in selectedBills) {
        totalCurCategory += selected['valor'];
      }

      values.addEntries({category: totalCurCategory}.entries);
    }

    print(values);

    return Container(
      width: double.infinity,
      height: 150,
      child: Card(
        color: ColorTheme.mainWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: PieChart(
                  PieChartData(
                    centerSpaceRadius: double.infinity,
                    sections: [
                      for (final category in categories)
                        PieChartSectionData(value: values[category], radius: 10)
                    ],
                  ),
                ),
              ),
              Text('DAAAAAmn'),
            ],
          ),
        ),
      ),
    );
  }
}
