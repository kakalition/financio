import 'package:financio/financio_proviers.dart';
import 'package:financio/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LatestTransactionsSection extends ConsumerWidget {
  const LatestTransactionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(latestHistoriesStream);

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
        const SizedBox(height: 8),
        data.when(
          data: (data) => Column(
            children: data.toLatestColumnChildren(),
          ),
          loading: () => const Text("Loading"),
          error: (error, stackTrace) => const Text("Error"),
        )
      ],
    );
  }
}
