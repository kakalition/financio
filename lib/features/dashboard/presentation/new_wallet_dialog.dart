import 'package:financio/features/dashboard/data/wallet_controller.dart';
import 'package:financio/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewWalletDialog extends ConsumerStatefulWidget {
  const NewWalletDialog({super.key});

  @override
  NewWalletDialogState createState() => NewWalletDialogState();
}

class NewWalletDialogState extends ConsumerState<NewWalletDialog> {
  late final WalletController walletController;

  @override
  void initState() {
    super.initState();
    walletController = ref.read(walletControllerProvider);
  }

  String name = "";
  String type = "wallet";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              walletController.addWallet(name, type);
              ref.invalidate(walletProvider);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Wallet added successfully.")),
              );
              Navigator.of(context).pop();
            },
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
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.grey[400]!, width: 1)),
              child: DropdownButton(
                underline: Container(height: 0),
                isExpanded: true,
                hint: const Text("Type"),
                value: type,
                onChanged: (string) {
                  setState(() {
                    type = string ?? "wallet";
                  });
                },
                items: const [
                  DropdownMenuItem(
                    value: "wallet",
                    child: Text("Wallet"),
                  ),
                  DropdownMenuItem(
                    value: "allocation",
                    child: Text("Allocation"),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
