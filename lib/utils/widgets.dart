import 'package:financio/db/database.dart';
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
}
