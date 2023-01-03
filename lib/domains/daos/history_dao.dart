import 'package:financio/domains/entities/history.dart';

abstract class IHistoryDao {
  Future<List<History>> get(int total);
  void insert(History wallet);
  void update(int id, History wallet);
  void delete(int id);
}
