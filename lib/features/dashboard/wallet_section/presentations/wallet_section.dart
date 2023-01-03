import 'package:financio/core/db/database.dart';
import 'package:financio/features/dashboard/data/wallet_controller.dart';
import 'package:financio/features/dashboard/presentation/wallet_menu_widget.dart';
import 'package:financio/features/dashboard/presentation/wallet_widget.dart';
import 'package:financio/financio_proviers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletSection extends ConsumerStatefulWidget {
  const WalletSection({Key? key}) : super(key: key);

  @override
  WalletsSectionState createState() => WalletsSectionState();
}

class WalletsSectionState extends ConsumerState {
  List<Widget> walletsToWidgets(
      List<Wallet> wallets, WalletController walletController) {
    List<Widget> list = [];

    wallets.forEach((e) {
      list.add(WalletWidget(wallet: e));
      list.add(const SizedBox(width: 8));
    });

    list.add(const WalletMenuWidget());

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final wallets = ref.watch(FinancioProvider.wallets);
    final walletController = ref.read(FinancioProvider.walletController);

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
          height: 96,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: wallets.when(
              data: (data) => Row(
                children: walletsToWidgets(data, walletController),
              ),
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
