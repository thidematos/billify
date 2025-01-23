import 'package:billify/services/bills_api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BillsNotifier extends StateNotifier<List> {
  BillsNotifier() : super([]);
}

final billsProvider = StateNotifierProvider<BillsNotifier, List>(
  (ref) => BillsNotifier(),
);

final fetchBillsProvider = FutureProvider((ref) {
  return getBills();
});
