import 'package:financio/core/db/collections/histories.dart';
import 'package:financio/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LatestTransactionsSection extends StatelessWidget {
  final List<Histories> histories;
  const LatestTransactionsSection({super.key, required this.histories});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Transaksi Terakhir",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Column(
          children: histories.toLatestColumnChildren(),
        )
      ],
    );
  }
}
