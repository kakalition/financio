import 'package:drift/drift.dart';

@DataClassName("History")
class Histories extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get isSpending => integer()();
  IntColumn get walletId => integer()();
  IntColumn get total => integer()();
  TextColumn get note => text()();
  DateTimeColumn get date => dateTime()();
}
