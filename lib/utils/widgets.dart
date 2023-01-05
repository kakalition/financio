import 'package:financio/containers/latest_transaction.dart';
import 'package:financio/core/db/collections/allocations.dart';
import 'package:financio/core/db/collections/histories.dart';
import 'package:financio/core/db/collections/wallets.dart';
import 'package:financio/features/dashboard/allocation_section/views/allocation_tile.dart';
import 'package:financio/features/dashboard/latest_transaction_section/views/latest_transaction_section.dart';
import 'package:financio/features/dashboard/wallet_section/views/wallet_menu_widget.dart';
import 'package:financio/features/dashboard/wallet_section/views/wallet_widget.dart';
import 'package:flutter/material.dart';

extension Widgets on List<Wallets> {
  List<DropdownMenuItem<int>> toDropdownItem() {
    dynamic walletIterable = map(
      (e) => DropdownMenuItem<int>(
        value: e.id,
        child: Text(e.name ?? ""),
      ),
    );

    return walletIterable.toList();
  }

  List<Widget> toWallets() {
    List<Widget> list = [];

    forEach((e) {
      list.add(WalletWidget(wallet: e));
      list.add(const SizedBox(width: 8));
    });

    list.add(const WalletMenuWidget());

    return list;
  }
}

extension ListAllocationsX on List<Allocations> {
  List<Widget> toAllocationChildren() {
    List<Widget> walletList = [];

    forEach((e) {
      walletList.add(AllocationTile(wallet: e));
      walletList.add(const SizedBox(height: 4));
    });

    return walletList;
  }
}

extension ListHistoriesX on List<Histories> {
  List<Widget> toColumnChildren() {
    List<Widget> walletList = [];

    forEach((e) {
      walletList.add(LastTransactionTile(data: e));
      walletList.add(const SizedBox(height: 8));
    });

    return walletList;
  }
}
