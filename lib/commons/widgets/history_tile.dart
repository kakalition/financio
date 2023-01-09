import 'package:financio/core/db/collections/histories.dart';
import 'package:financio/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryTile extends StatelessWidget {
  final Histories data;
  const HistoryTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleText = data.isSpending == false
        ? "Income to ${data.walletName} Wallet"
        : data.walletName;

    final totalText = data.isSpending == false
        ? "+${data.total?.toRupiah()}"
        : "-${data.total?.toRupiah()}";

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                titleText ?? "",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                totalText,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data.note ?? "",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                data.date?.toTransactionDate() ?? "",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
