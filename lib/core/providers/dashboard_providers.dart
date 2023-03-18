import 'package:financio/commons/enums/allocations_filter.dart';
import 'package:financio/containers/dashboard_data.dart';
import 'package:financio/core/db/collections/allocations.dart';
import 'package:financio/core/notifiers/dashboard_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardDataProvider =
    StateNotifierProvider<DashboardNotifier, DashboardData>((ref) {
  return DashboardNotifier(ref, const DashboardData());
});
