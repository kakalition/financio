import 'package:financio/core/db/repositories/wallet_repository.dart';
import 'package:financio/financio_proviers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewWalletDialog extends ConsumerStatefulWidget {
  const NewWalletDialog({super.key});

  @override
  NewWalletDialogState createState() => NewWalletDialogState();
}

class NewWalletDialogState extends ConsumerState<NewWalletDialog> {
  String name = "";

  void newWalletHandler(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<WalletRepository> walletRepository,
  ) {
    walletRepository.whenData((repository) async {
      await repository.add(name);
      ref.invalidate(walletsProvider);
    });

    Navigator.of(context).pop();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Wallet added successfully.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<WalletRepository> walletRepository =
        ref.watch(walletRepositoryProvider);

    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => newWalletHandler(context, ref, walletRepository),
          child: const Text("Save"),
        )
      ],
      title: const Text("Create new wallet"),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.only(top: 16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            onChanged: (value) {
              setState(() {
                name = value;
              });
            },
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 10,
              ),
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
        ]),
      ),
    );
  }
}
