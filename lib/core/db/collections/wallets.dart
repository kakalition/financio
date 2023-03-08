import 'package:isar/isar.dart';

part 'wallets.g.dart';

@collection
class Wallets {
  Id id = Isar.autoIncrement;
  String? name;
  double? total;
  bool? isPrimary;
  DateTime? createdDate;
}
