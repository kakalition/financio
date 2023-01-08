import 'package:financio/financio_proviers.dart';
import 'package:financio/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletSection extends ConsumerWidget {
  const WalletSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallets = ref.watch(walletsStream);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Wallets",
          style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 120,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: wallets.when(
              data: (data) => Row(children: data.toWallets()),
              loading: () => const Text("Still loading"),
              error: (error, stackTrace) => Text(
                error.toString(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
