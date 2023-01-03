import 'package:financio/domains/daos/wallet_dao.dart';
import 'package:financio/domains/entities/wallet.dart';

abstract class IWalletRepository {
  void insert(IWalletDao dao, Wallet wallet);
}
