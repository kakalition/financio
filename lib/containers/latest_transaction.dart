class LatestTransaction {
  final String walletName;
  final int isSpending;
  final int total;
  final String note;
  final DateTime date;

  const LatestTransaction(
    this.walletName,
    this.isSpending,
    this.total,
    this.note,
    this.date,
  );
}
