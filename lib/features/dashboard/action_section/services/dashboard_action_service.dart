import 'package:financio/core/db/daos/allocations_dao.dart';
import 'package:financio/core/db/daos/histories_dao.dart';
import 'package:financio/core/db/daos/wallets_dao.dart';

class DashboardActionService {
  final WalletsDao _walletsDao;
  final AllocationsDao _allocationsDao;
  final HistoriesDao _historiesDao;

  DashboardActionService(
    this._walletsDao,
    this._allocationsDao,
    this._historiesDao,
  );
}
