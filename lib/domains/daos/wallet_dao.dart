import 'package:financio/domains/entities/wallet.dart';

abstract class IWalletDao {
  Future<List<Wallet>> get(int total);
  void insert(Wallet wallet);
  void update(int id, Wallet wallet);
  void delete(int id);
}
