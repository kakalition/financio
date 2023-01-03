import 'package:isar/isar.dart';

part 'histories.g.dart';

@collection
class Histories {
  Id id = Isar.autoIncrement;
  bool? isSpending;
  String? walletName;
  int? total;
  String? note;
  DateTime? date;
}
