import 'package:isar/isar.dart';

part 'allocations.g.dart';

@collection
class Allocations {
  Id id = Isar.autoIncrement;
  String? name;
  double? total;
  DateTime? createdDate;
  double? totalLastAllocation;
  DateTime? lastAllocationDate;
}
