import 'package:financio/core/db/collections/allocations.dart';
import 'package:financio/utils/formatter.dart';
import 'package:flutter/material.dart';

class AllocationTile extends StatelessWidget {
  final Allocations wallet;
  const AllocationTile({super.key, required this.wallet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(children: [
        Text(wallet.name ?? ""),
        Text(wallet.total?.toRupiah() ?? "")
      ]),
    );
  }
}
