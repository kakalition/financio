import 'package:financio/commons/enums/wallets_filter.dart';
import 'package:financio/core/providers/wallet_providers.dart';
import 'package:financio/features/dashboard/wallet_section/views/new_wallet_dialog.dart';
import 'package:financio/features/wallets/views/wallets_filter_sheet.dart';
import 'package:financio/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tuple/tuple.dart';

class WalletsPage extends ConsumerStatefulWidget {
  const WalletsPage({super.key});

  @override
  WalletsPageState createState() => WalletsPageState();
}

class WalletsPageState extends ConsumerState<WalletsPage> {
  WalletsFilter filter = WalletsFilter.nameAscending;
  void applyFilter(WalletsFilter filter) {
    setState(() {
      this.filter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    final wallets = ref.watch(walletsState(Tuple2(null, filter)));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        child: Icon(
          FeatherIcons.plus,
          color: Theme.of(context).colorScheme.onTertiary,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const NewWalletDialog(),
          );
        },
      ),
      bottomNavigationBar: WidgetUtils.createNavigationBar(context),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 58,
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            color: Theme.of(context).colorScheme.surface,
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
                        builder: (context) => WalletsFilterSheet(
                          filter: filter,
                          applyFilter: applyFilter,
                        ),
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
        ),
      ),
    );
  }
}
