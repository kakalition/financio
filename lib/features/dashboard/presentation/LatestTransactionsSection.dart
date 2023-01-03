import 'package:financio/containers/latest_transaction.dart';
import 'package:financio/financio_proviers.dart';
import 'package:financio/utils/formatter.dart';
import 'package:financio/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LatestTransactionsSection extends ConsumerWidget {
  const LatestTransactionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(FinancioProvider.getLatestHistories);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Latest Transactions",
          style: GoogleFonts.poppins(
            fontSize: 36,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        data.when(
          data: (data) => Column(
            children: data.toColumnChildren(),
          ),
          loading: () => const Text("Loading"),
          error: (error, stackTrace) => const Text("Error"),
        )
      ],
    );
  }
}

class LastTransactionTile extends StatelessWidget {
  final LatestTransaction data;
  const LastTransactionTile({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleText =
        data.isSpending == 0 ? "Income to ${data.walletName}" : data.walletName;

    final totalText = data.isSpending == 0
        ? "+${data.total.toRupiah()}"
        : "-${data.total.toRupiah()}";

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                titleText,
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
                data.note,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[700],
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                data.date.toTransactionDate(),
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
