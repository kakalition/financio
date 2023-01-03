import 'package:freezed_annotation/freezed_annotation.dart';

part 'allocation.freezed.dart';

@Freezed()
class Allocation with _$Allocation {
  const factory Allocation({
    required int id,
    required String name,
    required int total,
    required DateTime lastAllocationDate,
    required int totalLastAllocation,
  }) = _Allocation;

  static Allocation fromMap(Map<String, dynamic> map) {
    return Allocation(
      id: map["id"],
      name: map["name"],
      total: map["total"],
      lastAllocationDate: map["last_allocation_date"],
      totalLastAllocation: map["total_last_allocation"],
    );
  }
}
