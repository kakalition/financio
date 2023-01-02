import 'package:drift/drift.dart';

@DataClassName("BudgetPlan")
class BudgetPlans extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get categoryId => integer()();
  IntColumn get total => integer()();
  DateTimeColumn get date => dateTime()();
}
