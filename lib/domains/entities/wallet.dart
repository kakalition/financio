import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet.freezed.dart';

@Freezed()
class Wallet with _$Wallet {
  const factory Wallet({
    required int id,
    required String name,
    required String type,
    required int total,
  }) = _Wallet;

  static Wallet fromMap(Map<String, dynamic> map) {
    return Wallet(
      id: map["id"],
      name: map["name"],
      type: map["type"],
      total: map["total"],
    );
  }
}
