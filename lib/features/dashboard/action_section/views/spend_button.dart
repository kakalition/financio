import 'package:financio/features/dashboard/action_section/views/spend_dialog.dart';
import 'package:financio/features/dashboard/action_section/views/spend_sheet.dart';
import 'package:flutter/material.dart';

class SpendButton extends StatelessWidget {
  const SpendButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton.icon(
        onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          useRootNavigator: true,
          context: context,
          builder: (context) => Wrap(children: const [SpendSheet()]),
        ),
        icon: const Icon(Icons.arrow_upward, size: 16),
        label: const Text("Spend"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          padding: const EdgeInsets.all(12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
