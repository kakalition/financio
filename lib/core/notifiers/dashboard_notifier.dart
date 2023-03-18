import 'dart:async';

import 'package:financio/commons/enums/allocations_filter.dart';
import 'package:financio/containers/dashboard_data.dart';
import 'package:financio/core/providers/aggregate_providers.dart';
import 'package:financio/core/providers/allocation_providers.dart';
import 'package:financio/core/providers/history_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

class DashboardNotifier extends StateNotifier<DashboardData> {
  final StateNotifierProviderRef ref;
  DashboardNotifier(this.ref, super.state);

  void initialize() async {
    final total = await ref.read(netWorthProvider.future);
    final allocations = await ref.read(allocationsState(const Tuple2(
      5,
      AllocationsFilter.totalAscending,
    )).future);

    final histories = await ref.read(historiesSnapshotState(const Tuple3(
      10,
      null,
      null,
    )).future);

    state = DashboardData(
      total: total,
      allocations: allocations,
      histories: histories,
    );
  }

  void spend() {}

  void income() {}
}
