import 'package:financio/core/db/repositories/wallet_repository.dart';
import 'package:financio/financio_proviers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteConfirmationDialog extends ConsumerWidget {
  final int id;

  const DeleteConfirmationDialog({super.key, required this.id});

  void deleteHandler(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<WalletRepository> walletRepository,
  ) {
    walletRepository.whenData((repository) async {
      await repository.delete(id);
      ref.invalidate(walletsProvider);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Wallet successfully deleted.")),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final walletRepository = ref.watch(walletRepositoryProvider);

    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => deleteHandler(context, ref, walletRepository),
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
