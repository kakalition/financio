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
    final te = DateFormat("dd MMMM yyyy HH:mm");
    return te.format(this).toString();
  }
}
