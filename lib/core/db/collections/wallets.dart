import 'package:isar/isar.dart';

part 'wallets.g.dart';

@collection
class Wallets {
  Id id = Isar.autoIncrement;
  String? name;
  int? total;
  bool? isPrimary;
  DateTime? createdDate;
}
