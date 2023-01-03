import 'package:financio/core/db/daos/wallets_dao.dart';
import 'package:financio/core/db/database.dart';

class WalletSectionService {
  final WalletsDao _walletsDao;

  WalletSectionService(this._walletsDao);

  Future<List<Wallet>> getWallets() {
    return _walletsDao.get();
  }
}
