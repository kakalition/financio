import 'package:freezed_annotation/freezed_annotation.dart';

part 'history.freezed.dart';

@Freezed()
class History with _$History {
  const factory History({
    required int id,
    required int isSpending,
    required int walletId,
    required int total,
    required String note,
    required DateTime date,
  }) = _History;

  static History fromMap(Map<String, dynamic> map) {
    return History(
      id: map["id"],
      isSpending: map["isSpending"],
      walletId: map["walletId"],
      total: map["total"],
      note: map["note"],
      date: map["date"],
    );
  }
}
