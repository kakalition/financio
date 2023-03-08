import 'package:flutter/material.dart';

class HistoriesFilterState {
  final DateTimeRange dateRange;

  HistoriesFilterState({DateTimeRange? dateRange})
      : dateRange = dateRange ??
            DateTimeRange(
              start: DateTime.now(),
              end: DateTime.now(),
            );
}
