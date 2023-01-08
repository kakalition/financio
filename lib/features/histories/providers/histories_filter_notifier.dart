import 'package:financio/features/histories/providers/histories_filter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoriesFilterNotifier extends StateNotifier<HistoriesFilterState> {
  HistoriesFilterNotifier() : super(HistoriesFilterState());

  void changeDate(DateTimeRange range) {
    state = HistoriesFilterState(dateRange: range);
  }

  void changeStartDate(DateTime date) {
    final newDateRange = DateTimeRange(start: date, end: state.dateRange.end);
    state = HistoriesFilterState(dateRange: newDateRange);
  }

  void changeEndDate(DateTime date) {
    final newDateRange = DateTimeRange(start: state.dateRange.start, end: date);
    state = HistoriesFilterState(dateRange: newDateRange);
  }
}
