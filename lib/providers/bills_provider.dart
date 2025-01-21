import 'package:billify/models/bill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BillsNotifier extends StateNotifier<List<Bill>> {
  BillsNotifier() : super([]);

  void addBill(Bill bill) {
    state = [...state, bill];
  }
}

final BillsProvider =
    StateNotifierProvider<BillsNotifier, List<Bill>>((ref) => BillsNotifier());
