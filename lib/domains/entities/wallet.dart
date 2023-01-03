import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';

@Freezed()
class Wallet with _$Wallet {
  const factory Wallet({
    required int id,
    required String name,
    required int total,
    required DateTime createdDate,
  }) = _Wallet;

  static Wallet fromMap(Map<String, dynamic> map) {
    return Wallet(
      id: map["id"],
      name: map["name"],
      total: map["total"],
      createdDate: map["created_date"],
    );
  }
}
