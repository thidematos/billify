import 'package:billify/data/months.dart';
import 'package:billify/providers/bills_provider.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:billify/utils/get_cur_month_bills.dart';
import 'package:billify/widgets/home/resume_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Resumes extends ConsumerWidget {
  const Resumes({super.key});

  double calculateTotals(List bills) {
    final List monthlyBills = getCurMonthBills(bills);
    final values = monthlyBills.map((item) => item['valor']).toList();

    final double total = values.reduce((acc, item) => acc + item);

    return total;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bills = ref.watch(fetchBillsProvider);

    return bills.when(
      error: (error, stackTrace) => Text('Something went wrong'),
      loading: () => CircularProgressIndicator(),
      data: (bills) {
        final double total = calculateTotals(bills);

        return Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kMonths[DateTime.now().month]!,
              style: TypographyTheme.homeSubtitle,
            ),
            Row(
              spacing: 12,
              children: [
                ResumeCard('Despesas', Icons.monetization_on_outlined, total),
                ResumeCard('Renda', Icons.savings_outlined, total),
              ],
            ),
          ],
        );
      },
    );
  }
}
