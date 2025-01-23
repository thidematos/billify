import 'package:billify/providers/bills_provider.dart';
import 'package:billify/themes/color_theme.dart';
import 'package:billify/themes/typography_theme.dart';
import 'package:billify/widgets/home/to_be_paid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ToBePaid extends ConsumerWidget {
  const ToBePaid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bills = ref.watch(fetchBillsProvider);

    return bills.when(
      data: (bills) {
        List toExpire =
            bills.where((bill) => bill['isToExpire'] == true).toList();

        toExpire.sort((a, b) {
          return a['vencimento'] - b['vencimento'];
        });

        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              Text('Vencimento próximo', style: TypographyTheme.homeSubtitle),
              Container(
                height: 125,
                child: Scrollbar(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    scrollDirection: Axis.horizontal,
                    itemCount: toExpire.length,
                    itemBuilder: (ctx, index) => ToBePaidCard(toExpire[index]),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Text('There was an error!'),
      loading: () => CircularProgressIndicator(),
    );
  }
}
