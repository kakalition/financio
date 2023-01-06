import 'package:financio/commons/widgets/simple_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:financio/utils/formatter.dart';

class HistoriesSummaries extends StatelessWidget {
  final int totalIncome;
  final int totalSpending;

  const HistoriesSummaries({
    super.key,
    required this.totalIncome,
    required this.totalSpending,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SimpleCardWidget(
            title: "Total Income",
            body: totalIncome.toRupiah(),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: SimpleCardWidget(
            title: "Total Spending",
            body: totalSpending.toRupiah(),
          ),
        ),
      ],
    );
  }
}
