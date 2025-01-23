Map<String, bool> verifyExpirationUnique(DateTime vencimento) {
  final DateTime vencimentoLocalDate = vencimento.toLocal();
  final DateTime nowLocal = DateTime.now().toLocal();
  final DateTime today = DateTime(nowLocal.year, nowLocal.month, nowLocal.day);

  /* final DateTime sevenDaysAhead = today.add(const Duration(days: 7));
  final DateTime threeDaysAhead = today.add(const Duration(days: 3)); */

  final Map<String, bool> verifications = {
    'expires_seven_days': false,
    'expires_three_days': false,
    'expires_today': false,
    'expired': false,
    'isToExpire': false,
  };

  final int differenceTimestamp = DateTime.fromMillisecondsSinceEpoch(
    vencimentoLocalDate.millisecondsSinceEpoch - today.millisecondsSinceEpoch,
  ).day;

  print(DateTime.fromMillisecondsSinceEpoch(differenceTimestamp).day);

  if (differenceTimestamp <= 7 || vencimentoLocalDate.compareTo(today) == 0) {
    verifications['isToExpire'] = true;
  }

  if (differenceTimestamp <= 7 && differenceTimestamp > 3) {
    verifications['expires_seven_days'] = true;
  }

  if (differenceTimestamp <= 3 && differenceTimestamp > 1) {
    verifications['expires_three_days'] = true;
  }

  if (vencimentoLocalDate.compareTo(today) == 0) {
    verifications['expires_today'] = true;
  }

  if (vencimentoLocalDate.isBefore(today)) {
    verifications['expired'] = true;
  }

  return verifications;
}

Map<String, bool> verifyExpirationRecurrent(int vencimento) {
  final DateTime nowLocal = DateTime.now().toLocal();
  final DateTime today = DateTime(nowLocal.year, nowLocal.month, nowLocal.day);

  final Map<String, bool> verifications = {
    'expires_seven_days': false,
    'expires_three_days': false,
    'expires_today': false,
  };

  if (today.day + 7 == vencimento) {
    verifications['expires_seven_days'] = true;
  }

  if (today.day + 3 == vencimento) {
    verifications['expires_three_days'] = true;
  }

  if (today.day == vencimento) {
    verifications['expires_today'] = true;
  }

  return verifications;
}
