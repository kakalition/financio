import 'package:financio/core/db/collections/wallets.dart';
import 'package:financio/features/dashboard/wallet_section/views/actions_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:financio/utils/formatter.dart';

class WalletWidget extends StatelessWidget {
  final Wallets wallet;

  const WalletWidget({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ActionsModalBottomSheet(
                title: wallet.name ?? "",
                id: wallet.id,
              );
            },
          );
        },
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 80),
          child: Container(
            padding: const EdgeInsets.only(left: 16, right: 48),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  wallet.name ?? "",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  wallet.total?.toRupiah() ?? "",
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
