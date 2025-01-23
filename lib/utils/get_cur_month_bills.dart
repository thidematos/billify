List getCurMonthBills(List bills) {
  final monthlyBills = bills
      .where(
        (bill) =>
            DateTime.fromMillisecondsSinceEpoch(bill['vencimento']).month ==
            DateTime.now().month,
      )
      .toList();

  return monthlyBills;
}
