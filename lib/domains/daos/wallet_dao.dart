import 'package:financio/domains/entities/wallet.dart';

abstract class IWalletDao {
  void insert(Wallet wallet);
}
