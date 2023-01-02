import 'package:intl/intl.dart';

extension Formatter on int {
  String toRupiah() {
    return NumberFormat.simpleCurrency(name: "IDR", decimalDigits: 0)
        .format(this)
        .replaceAll(',', '.');
  }
}
