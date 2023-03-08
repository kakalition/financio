import 'package:financio/core/db/repositories/allocation_repository.dart';
import 'package:financio/financio_proviers.dart';
import 'package:financio/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewAllocationDialog extends ConsumerStatefulWidget {
  const NewAllocationDialog({super.key});

  @override
  NewAllocationDialogState createState() => NewAllocationDialogState();
}

class NewAllocationDialogState extends ConsumerState<NewAllocationDialog> {
  String name = "";
  double initialAllocation = 0;
  int? targetWalletId;

  void newAllocationHandler(
    BuildContext context,
    WidgetRef ref,
    AsyncValue<AllocationRepository> allocationRepository,
  ) {
    allocationRepository.whenData((repository) async {
      await repository.add(name, initialAllocation, targetWalletId);
      ref.invalidate(walletsProvider);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Allocation added successfully.")),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final allocationRepository = ref.watch(allocationRepositoryProvider);

    final wallets = ref.watch(walletsStream);

    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () =>
              newAllocationHandler(context, ref, allocationRepository),
          child: const Text("Save"),
        )
      ],
      title: const Text("Create new allocation"),
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
          TextField(
            onChanged: (value) {
              setState(() {
                if (value == "") {
                  initialAllocation = 0;
                } else {
                  initialAllocation = double.parse(value);
                }
              });
            },
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 10,
              ),
              border: OutlineInputBorder(),
              labelText: "Initial allocation",
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          const SizedBox(height: 8),
          initialAllocation != 0
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey[400]!, width: 1)),
                  child: wallets.when(
                    data: (data) => DropdownButton(
                      underline: Container(height: 0),
                      isExpanded: true,
                      hint: const Text("Deduct from"),
                      onChanged: (value) => setState(() {
                        targetWalletId = value ?? 1;
                      }),
                      value: targetWalletId,
                      items: data.toDropdownItem(),
                    ),
                    error: (error, stackTrace) => const Text("Errors"),
                    loading: () => const Text("Loading"),
                  ),
                )
              : Container(),
        ]),
      ),
    );
  }
}
