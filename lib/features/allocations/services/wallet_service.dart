import 'package:financio/commons/enums/wallets_filter.dart';
import 'package:financio/core/db/collections/wallets.dart';
import 'package:financio/core/db/repositories/wallet_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WalletService {
  final AsyncValue<WalletRepository> repository;

  WalletService({required this.repository});

  Future<List<Wallets>> getWallets({String? name, WalletsFilter? filter}) {
    return repository.when(
      data: (repo) => repo.get(),
      loading: () => Future.value([]),
      error: (error, stackTrace) => Future.error(error),
    );
  }
}
