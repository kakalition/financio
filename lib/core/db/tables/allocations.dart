import 'package:drift/drift.dart';

class Allocations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get total => integer()();
  DateTimeColumn get createdDate => dateTime()();
  IntColumn get totalLastAllocation => integer()();
  DateTimeColumn get lastAllocationDate => dateTime()();
}
