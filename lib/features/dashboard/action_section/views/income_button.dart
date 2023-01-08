import 'package:financio/features/dashboard/action_section/views/income_dialog.dart';
import 'package:financio/features/dashboard/action_section/views/income_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncomeButton extends ConsumerWidget {
  const IncomeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () => showModalBottomSheet(
          isScrollControlled: true,
          useRootNavigator: true,
          context: context,
          builder: (context) => Wrap(children: const [IncomeSheet()]),
        ),
        icon: const Icon(Icons.arrow_downward, size: 16),
        label: const Text("Income"),
        style: OutlinedButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
