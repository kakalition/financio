import 'package:financio/core/db/collections/wallets.dart';
import 'package:financio/features/wallets/views/wallet_card.dart';
import 'package:financio/features/wallets/views/wallets_filter_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:financio/financio_proviers.dart';

class WalletsPage extends ConsumerStatefulWidget {
  const WalletsPage({super.key});

  @override
  WalletsPageState createState() => WalletsPageState();
}

class WalletsPageState extends ConsumerState<WalletsPage> {
  @override
  Widget build(BuildContext context) {
    final wallets = ref.watch(walletsStream);

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dompet",
                  style: GoogleFonts.poppins(
                      fontSize: 36, fontWeight: FontWeight.w500),
                ),
                IconButton(
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => const WalletsFilterSheet(),
                  ),
                  icon: const Icon(Icons.filter_alt_outlined),
                )
              ],
            ),
            const SizedBox(height: 24),
            ...wallets.when(
              data: (wallets) => wallets.toWalletCards(),
              error: ((error, stackTrace) => [Container()]),
              loading: (() => [const CircularProgressIndicator()]),
            ),
          ],
        ),
      ),
    );
  }
}

extension WalletPageX on List<Wallets> {
  List<Widget> toWalletCards() {
    List<Widget> list = [];

    forEach((e) {
      list.add(WalletCard(wallet: e));
      list.add(const SizedBox(width: 8));
    });

    return list;
  }
}
