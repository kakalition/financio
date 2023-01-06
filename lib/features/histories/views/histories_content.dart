import 'package:financio/core/db/collections/histories.dart';
import 'package:financio/utils/formatter.dart';
import 'package:financio/features/histories/views/histories_summaries.dart';
import 'package:financio/features/histories/views/sectioned_histories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoriesContent extends StatelessWidget {
  final List<Histories> histories;

  const HistoriesContent({super.key, required this.histories});

  @override
  Widget build(BuildContext context) {
    final element = histories.isEmpty
        ? Text(
            "No Transaction Found",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.grey[900],
              fontSize: 36,
            ),
          )
        : SectionedHistories(list: histories);

    return Column(children: [
      HistoriesSummaries(
        totalIncome: histories.getTotalIncome(),
        totalSpending: histories.getTotalSpending(),
      ),
      const SizedBox(
        height: 48,
      ),
      element,
    ]);
  }
}
