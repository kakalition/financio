import 'package:financio/core/db/collections/allocations.dart';
import 'package:financio/core/db/collections/histories.dart';

class DashboardData {
  final double? total;
  final List<Allocations>? allocations;
  final List<Histories>? histories;

  const DashboardData({
    this.total,
    this.allocations,
    this.histories,
  });
}
