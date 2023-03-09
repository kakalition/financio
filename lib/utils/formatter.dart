import 'package:financio/core/db/collections/histories.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

String monthNumberToIndonesianMonth(int month) {
  switch (month) {
    case 1:
      return 'Januari';
    case 2:
      return 'Februari';
    case 3:
      return 'Maret';
    case 4:
      return 'April';
    case 5:
      return 'Mei';
    case 6:
      return 'Juni';
    case 7:
      return 'Juli';
    case 8:
      return 'Agustus';
    case 9:
      return 'September';
    case 10:
      return 'Oktober';
    case 11:
      return 'November';
    case 12:
      return 'Desember';
  }

  return 'undefined';
}

extension Formatter on int {
  String toRupiah() {
    return NumberFormat.simpleCurrency(name: "IDR", decimalDigits: 0)
        .format(this)
        .replaceAll(',', '.');
  }
}

extension DoubleFormatter on double {
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

  String toIndonesianDate() {
    return "$day ${monthNumberToIndonesianMonth(month)} $year";
  }
}

extension ListHistoriesX on List<Histories> {
  double getTotalSpending() {
    double total = 0;

    forEach((element) {
      if (element.isSpending == true) total += element.total ?? 0;
    });

    return total;
  }

  double getTotalIncome() {
    double total = 0;

    forEach((element) {
      if (element.isSpending == false) total += element.total ?? 0;
    });

    return total;
  }
}
