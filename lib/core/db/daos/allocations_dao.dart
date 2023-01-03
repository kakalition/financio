import 'package:drift/drift.dart';
import 'package:financio/core/db/database.dart';
import 'package:financio/core/db/tables/wallets.dart';

part 'allocations_dao.g.dart';

@DriftAccessor(tables: [Wallets])
class AllocationsDao extends DatabaseAccessor<Database>
    with _$AllocationsDaoMixin {
  AllocationsDao(Database db) : super(db);

  Future<List<Allocation>> get() async {
    final select = db.select(db.allocations);
    final data = select.get();

    return data;
  }

  Future<int> add(String name, String type) {
    InsertStatement<$AllocationsTable, Allocation> insert =
        db.into(db.allocations);

    return insert.insert(
      AllocationsCompanion.insert(
        name: name,
        total: 0,
        createdDate: DateTime.now(),
        totalLastAllocation: 0,
        lastAllocationDate: DateTime.now(),
      ),
    );
  }

  Future<int> remove(int id) {
    DeleteStatement<$AllocationsTable, Allocation> delete = db.delete(db.allocations);
    delete.where((tbl) => tbl.id.equals(id));

    return delete.go();
  }
}
