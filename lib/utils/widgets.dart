import 'package:financio/commons/widgets/history_tile.dart';
import 'package:financio/core/db/collections/allocations.dart';
import 'package:financio/core/db/collections/histories.dart';
import 'package:financio/core/db/collections/wallets.dart';
import 'package:financio/features/dashboard/allocation_section/views/allocation_tile.dart';
import 'package:financio/features/dashboard/wallet_section/views/wallet_menu_widget.dart';
import 'package:financio/features/dashboard/wallet_section/views/wallet_widget.dart';
import 'package:financio/features/wallets/views/wallet_card.dart';
import 'package:financio/routes/financio_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

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

  List<Widget> toWalletCards() {
    List<Widget> list = [];

    forEach((e) {
      list.add(WalletCard(wallet: e));
      list.add(const SizedBox(height: 8));
    });

    return list;
  }
}

extension ListAllocationsX on List<Allocations> {
  List<Widget> toAllocationChildren() {
    if (length == 0) {
      return [
        Text(
          "Kamu tidak memiliki alokasi keuangan.",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        )
      ];
    }

    List<Widget> walletList = [];

    forEach((e) {
      walletList.add(AllocationTile(allocation: e));
      walletList.add(const SizedBox(height: 4));
    });

    return walletList;
  }

  List<DropdownMenuItem<int>> toDropdownItems() {
    dynamic allocationsIterable = map(
      (e) => DropdownMenuItem<int>(
        value: e.id,
        child: Text(e.name ?? ""),
      ),
    );

    return allocationsIterable.toList();
  }
}

extension ListHistoriesWidgetX on List<Histories> {
  List<Widget> toColumnChildren() {
    List<Widget> walletList = [];

    forEach((e) {
      walletList.add(HistoryTile(data: e));
      walletList.add(const SizedBox(height: 8));
    });

    return walletList;
  }

  List<Widget> toLatestColumnChildren() {
    if (length == 0) {
      return [
        Text(
          "Kamu belum melakukan transaksi apapun.",
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        )
      ];
    }

    List<Widget> walletList = [];

    forEach((e) {
      walletList.add(HistoryTile(data: e));
      walletList.add(const SizedBox(height: 8));
    });

    return walletList;
  }
}

class WidgetUtils {
  static Widget createNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(FeatherIcons.home),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(FeatherIcons.creditCard),
          label: 'Dompet',
        ),
        BottomNavigationBarItem(
          icon: Icon(FeatherIcons.clock),
          label: 'Riwayat',
        ),
      ],
      currentIndex: FinancioRouter.calculateNavigationIndex(context),
      onTap: (value) => FinancioRouter.onNavigationItemTapped(value, context),
    );
  }
}
