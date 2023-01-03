import 'package:drift/drift.dart';

class Wallets extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get total => integer()();
  DateTimeColumn get createdDate => dateTime()();
}
