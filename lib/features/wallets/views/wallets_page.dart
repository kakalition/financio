import 'package:financio/features/wallets/views/wallets_filter_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:financio/financio_proviers.dart';
import 'package:financio/utils/widgets.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wallets",
                  style: GoogleFonts.poppins(
                      fontSize: 48, fontWeight: FontWeight.w500),
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
