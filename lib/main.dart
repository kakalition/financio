import 'package:financio/db/database.dart';
import 'package:financio/features/dashboard/data/wallet_controller.dart';
import 'package:financio/routes/router.dart' as f_router;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dbProvider = Provider.autoDispose((ref) {
  final Database db = Database();
  ref.onDispose(() => db.close());
  return db;
});

final walletControllerProvider = Provider((ref) {
  final db = ref.read(dbProvider);
  return WalletController(db);
});

final walletDaoProvider = Provider((ref) {
  final db = ref.read(dbProvider);
  return db.walletsDao;
});

final walletProvider = FutureProvider(((ref) {
  final walletsDao = ref.read(walletDaoProvider);

  return walletsDao.getWallets();
}));

Future<void> main() async {
  // runApp(Provider(
  //   create: (context) => Database(),
  //   child: const Financio(),
  //   dispose: (context, value) => value.close(),
  // ));
  runApp(const ProviderScope(child: Financio()));
}

class Financio extends StatelessWidget {
  const Financio({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: f_router.Router.getFinancioRouter(),
      title: 'Financio',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
      ),
    );
  }
}