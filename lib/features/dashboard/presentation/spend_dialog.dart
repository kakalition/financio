import 'package:financio/db/database.dart';
import 'package:financio/utils/widgets.dart';
import 'package:financio/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SpendDialog extends ConsumerStatefulWidget {
  const SpendDialog({super.key});

  @override
  SpendDialogState createState() => SpendDialogState();
}

class SpendDialogState extends ConsumerState<SpendDialog> {
  late final AsyncValue<List<Wallet>> allocations;

  int total = 0;
  String note = "";
  int? targetWalletId;

  @override
  void initState() {
    super.initState();
    allocations = ref.read(allocationProvider);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text("Save"),
          onPressed: () {
            ref
                .read(walletDaoProvider)
                .deductFromAllocation(targetWalletId!, total, note);
            ref.invalidate(walletProvider);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Spend successfully deducted from allocation.")));
            Navigator.of(context).pop();
          },
        )
      ],
      title: const Text("Spend money"),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        padding: const EdgeInsets.only(top: 16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          TextField(
            onChanged: ((value) => setState(() {
                  total = int.parse(value);
                })),
            decoration: const InputDecoration(
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              border: OutlineInputBorder(),
              labelText: "Total Spending",
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            onChanged: ((value) => setState(() {
                  note = value;
                })),
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
            child: allocations.when(
                data: (data) => DropdownButton(
                      underline: Container(height: 0),
                      isExpanded: true,
                      hint: const Text("Deduct from"),
                      onChanged: (value) => setState(() {
                        targetWalletId = value;
                      }),
                      value: targetWalletId,
                      items: data.toDropdownItem(),
                    ),
                error: ((error, stackTrace) => const Text("Errors")),
                loading: () => const Text("Loading")),
          ),
        ]),
      ),
    );
  }
}
