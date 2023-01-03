import 'package:financio/db/database.dart';
import 'package:financio/financio_proviers.dart';
import 'package:financio/main.dart';
import 'package:financio/notifications/refresh_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:financio/utils/formatter.dart';

class WalletWidget extends StatelessWidget {
  final Wallet wallet;
  late Color? chipBgColor;
  late Color? chipTextColor;

  WalletWidget({super.key, required this.wallet}) {
    chipBgColor =
        wallet.type == "wallet" ? Colors.blue[200] : Colors.orange[200];
    chipTextColor =
        wallet.type == "wallet" ? Colors.blueGrey[800] : Colors.deepOrange[800];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[100],
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return WalletWidgetModalBottomSheet(
                title: wallet.name,
                id: wallet.id,
              );
            },
          );
        },
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
                wallet.name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                wallet.total.toRupiah(),
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
    );
  }
}

class WalletWidgetModalBottomSheet extends StatelessWidget {
  final String title;
  final int id;

  const WalletWidgetModalBottomSheet({
    super.key,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Divider(height: 1),
        ListTile(
          title: Text(
            "Moves money",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.grey[800],
            ),
          ),
          onTap: (() {}),
        ),
        ListTile(
          title: Text(
            "Edit wallet",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.grey[800],
            ),
          ),
          onTap: (() {}),
        ),
        ListTile(
          title: Text(
            "Delete wallet",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Colors.grey[800],
            ),
          ),
          onTap: (() {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => DeleteConfirmationDialog(id: id),
            );
          }),
        ),
      ],
    );
  }
}

class DeleteConfirmationDialog extends ConsumerWidget {
  final int id;

  const DeleteConfirmationDialog({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            ref.read(FinancioProvider.walletsDao).deleteWallet(id);
            ref.invalidate(FinancioProvider.wallets);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Wallet successfully deleted.")));
            Navigator.of(context).pop();
          },
          child: const Text("Delete"),
        )
      ],
      title: const Text("Delete wallet"),
      content: Container(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          "Are you sure want to delete this wallet? This action cannot be undone.",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.grey[800],
          ),
        ),
      ),
    );
  }
}
