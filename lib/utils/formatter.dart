import 'package:financio/core/db/collections/histories.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension Formatter on int {
  String toRupiah() {
    return NumberFormat.simpleCurrency(name: "IDR", decimalDigits: 0)
        .format(this)
        .replaceAll(',', '.');
  }
}

extension DateFormatter on DateTime {
  String toTransactionDate() {
    final formatter = DateFormat("dd MMMM yyyy HH:mm");
    return formatter.format(this);
  }

  String toLocalDate() {
    final formatter = DateFormat("dd MMMM yyyy");
    return formatter.format(this).toString();
  }

  DateTime changeTimeToLowerBound() {
    return DateTime(year, month, day, 0, 0, 0);
  }

  DateTime changeTimeToUpperBound() {
    return DateTime(year, month, day, 23, 59, 59);
  }
}

extension ListHistoriesX on List<Histories> {
  int getTotalSpending() {
    int total = 0;

    forEach((element) {
      if (element.isSpending == true) total += element.total ?? 0;
    });

    return total;
  }

  int getTotalIncome() {
    int total = 0;

    forEach((element) {
      if (element.isSpending == false) total += element.total ?? 0;
    });

    return total;
  }
}
