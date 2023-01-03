import 'package:drift/drift.dart';
import 'package:financio/containers/latest_transaction.dart';
import 'package:financio/core/db/database.dart';
import 'package:financio/core/db/tables/histories.dart';

part 'histories_dao.g.dart';

@DriftAccessor(tables: [Histories])
class HistoriesDao extends DatabaseAccessor<Database> with _$HistoriesDaoMixin {
  HistoriesDao(Database db) : super(db);

  Future<List<LatestTransaction>> getLatestHistories(int total) async {
    final data = db.customSelect("""
      SELECT histories.id, histories.total, histories.is_spending, histories.note, histories.date, wallets.name
      FROM histories
      JOIN wallets ON histories.wallet_id = wallets.id
    """);

    final select = data.map<LatestTransaction>((p0) => LatestTransaction(
          p0.read("name"),
          p0.read("is_spending"),
          p0.read("total"),
          p0.read("note"),
          p0.read("date"),
        ));

    return select.get();
  }
}
