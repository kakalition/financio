import 'package:financio/domains/entities/allocation.dart';

abstract class IAllocationDao {
  Future<List<Allocation>> get(int total);
  void insert(Allocation wallet);
  void update(int id, Allocation wallet);
  void delete(int id);
}
