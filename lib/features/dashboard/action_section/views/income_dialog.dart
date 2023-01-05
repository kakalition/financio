import 'package:flutter/material.dart';
import 'package:financio/financio_proviers.dart';
import 'package:financio/utils/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncomeDialog extends ConsumerStatefulWidget {
  const IncomeDialog({super.key});

  @override
  IncomeDialogState createState() => IncomeDialogState();
}

class IncomeDialogState extends ConsumerState<IncomeDialog> {
  int total = 0;
  String note = "";
  int? targetWalletId;

  @override
  Widget build(BuildContext context) {
    final repository = ref.watch(transactionRepositoryProvider);
    final wallets = ref.watch(walletsProvider);

    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () => {Navigator.of(context).pop()},
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            repository.whenData((value) async {
              await value.allocateToWallet(targetWalletId!, total, note);
              ref.invalidate(walletsProvider);
              ref.invalidate(latestHistoriesProvider);
            });

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Income successfully added to wallet.")));

            Navigator.of(context).pop();
          },
          child: const Text("Save"),
        )
      ],
      title: const Text("Allocate to wallet"),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.only(top: 16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            onChanged: (value) => setState(() {
              total = int.parse(value);
            }),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              border: OutlineInputBorder(),
              labelText: "Total Income",
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            onChanged: (value) => setState(() {
              note = value;
            }),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              border: OutlineInputBorder(),
              labelText: "Note",
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey[400]!, width: 1)),
            child: wallets.when(
              data: (data) => DropdownButton(
                underline: Container(height: 0),
                isExpanded: true,
                hint: const Text("Target Wallet"),
                onChanged: (value) => setState(() {
                  targetWalletId = value ?? 1;
                }),
                value: targetWalletId,
                items: data.toDropdownItem(),
              ),
              error: (error, stackTrace) => const Text("Errors"),
              loading: () => const Text("Loading"),
            ),
          ),
        ]),
      ),
    );
  }
}
