import 'package:financio/containers/latest_transaction.dart';
import 'package:financio/core/db/database.dart';
import 'package:financio/features/dashboard/allocation_section/presentations/allocation_tile.dart';
import 'package:financio/features/dashboard/latest_transaction_section/presentations/latest_transaction_section.dart';
import 'package:flutter/material.dart';

extension Widgets on List<Wallet> {
  List<DropdownMenuItem<int>> toDropdownItem() {
    dynamic walletIterable = map(
      (e) => DropdownMenuItem<int>(
        value: e.id,
        child: Text(e.name),
      ),
    );

    return walletIterable.toList();
  }

  List<Widget> toAllocationChildren() {
    List<Widget> walletList = [];

    forEach((e) {
      walletList.add(AllocationTile(wallet: e));
      walletList.add(const SizedBox(height: 4));
    });

    return walletList;
  }
}

extension WidgetsLatestTransaction on List<LatestTransaction> {
  List<Widget> toColumnChildren() {
    List<Widget> walletList = [];

    forEach((e) {
      walletList.add(LastTransactionTile(data: e));
      walletList.add(const SizedBox(height: 8));
    });

    return walletList;
  }
}
