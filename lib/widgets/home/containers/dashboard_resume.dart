import 'package:billify/providers/bills_provider.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:billify/utils/get_cur_month_bills.dart';
import 'package:billify/widgets/home/dashboard_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardResume extends ConsumerWidget {
  const DashboardResume({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final futureBills = ref.watch(fetchBillsProvider);

    return futureBills.when(
      data: (bills) {
        final List monthlyBills = getCurMonthBills(bills);

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 24,
          children: [
            Text('Dashboard', style: TypographyTheme.homeSubtitle),
            DashboardCard(monthlyBills),
          ],
        );
      },
      error: (error, stackTrace) => Text('There was a problem loading data'),
      loading: () => CircularProgressIndicator(),
    );
  }
}
