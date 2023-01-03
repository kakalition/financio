import 'package:financio/features/dashboard/presentation/dashboard_income_button.dart';
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
        onPressed: () => showDialog(
          context: context,
          builder: (context) => const IncomeDialog(),
        ),
        icon: const Icon(Icons.arrow_downward, size: 16),
        label: const Text("Income"),
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.grey[900],
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: BorderSide(color: Colors.grey[300]!, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
