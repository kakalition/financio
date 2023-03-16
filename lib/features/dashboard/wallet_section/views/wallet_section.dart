import 'package:financio/features/dashboard/wallet_section/providers/money_providers.dart';
import 'package:financio/utils/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletSection extends ConsumerWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final netWorth = ref.watch(netWorthProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Total Uang",
          style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.primary),
        ),
        netWorth.when(
          data: (data) => Text(
            data.toRupiah(),
            style: GoogleFonts.poppins(
                fontSize: 48,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary),
          ),
          loading: () => const Text("Still loading"),
          error: (error, stackTrace) => Text(
            error.toString(),
          ),
        ),
      ],
    );
  }
}
