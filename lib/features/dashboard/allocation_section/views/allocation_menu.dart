import 'package:financio/colors.dart';
import 'package:financio/features/allocations/views/new_allocation_sheet.dart';
import 'package:flutter/material.dart';

class AllocationMenu extends StatelessWidget {
  const AllocationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: surfaceColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            useRootNavigator: true,
            context: context,
            builder: (context) => Wrap(children: const [NewAllocationSheet()]),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          child: Icon(Icons.add, color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
