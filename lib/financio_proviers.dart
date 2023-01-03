import 'package:financio/db/database.dart';
import 'package:financio/features/dashboard/data/wallet_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FinancioProvider {
  static final db = Provider.autoDispose((ref) {
    final Database db = DatabaseWrapper.getInstance();
    // ref.onDispose(() => db.close());
    return db;
  });

  static final walletController = Provider((ref) {
    final db = ref.read(FinancioProvider.db);
    return WalletController(db);
  });

  static final walletsDao = Provider((ref) {
    final db = ref.read(FinancioProvider.db);
    return db.walletsDao;
  });

  static final historiesDao = Provider((ref) {
    final db = ref.read(FinancioProvider.db);
    return db.historiesDao;
  });

  static final wallets = FutureProvider(((ref) {
    return ref.read(walletsDao).getWallets();
  }));

  static final getLatestHistories = FutureProvider(((ref) {
    return ref.read(historiesDao).getLatestHistories(10);
  }));

  static final allocations = FutureProvider(((ref) {
    return ref.read(walletsDao).getAllocations();
  }));
}
