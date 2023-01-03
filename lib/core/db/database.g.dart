// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Wallet extends DataClass implements Insertable<Wallet> {
  final int id;
  final String name;
  final int total;
  final DateTime createdDate;
  const Wallet(
      {required this.id,
      required this.name,
      required this.total,
      required this.createdDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['total'] = Variable<int>(total);
    map['created_date'] = Variable<DateTime>(createdDate);
    return map;
  }

  WalletsCompanion toCompanion(bool nullToAbsent) {
    return WalletsCompanion(
      id: Value(id),
      name: Value(name),
      total: Value(total),
      createdDate: Value(createdDate),
    );
  }

  factory Wallet.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Wallet(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      total: serializer.fromJson<int>(json['total']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'total': serializer.toJson<int>(total),
      'createdDate': serializer.toJson<DateTime>(createdDate),
    };
  }

  Wallet copyWith({int? id, String? name, int? total, DateTime? createdDate}) =>
      Wallet(
        id: id ?? this.id,
        name: name ?? this.name,
        total: total ?? this.total,
        createdDate: createdDate ?? this.createdDate,
      );
  @override
  String toString() {
    return (StringBuffer('Wallet(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('total: $total, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, total, createdDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Wallet &&
          other.id == this.id &&
          other.name == this.name &&
          other.total == this.total &&
          other.createdDate == this.createdDate);
}

class WalletsCompanion extends UpdateCompanion<Wallet> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> total;
  final Value<DateTime> createdDate;
  const WalletsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.total = const Value.absent(),
    this.createdDate = const Value.absent(),
  });
  WalletsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int total,
    required DateTime createdDate,
  })  : name = Value(name),
        total = Value(total),
        createdDate = Value(createdDate);
  static Insertable<Wallet> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? total,
    Expression<DateTime>? createdDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (total != null) 'total': total,
      if (createdDate != null) 'created_date': createdDate,
    });
  }

  WalletsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? total,
      Value<DateTime>? createdDate}) {
    return WalletsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      total: total ?? this.total,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WalletsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('total: $total, ')
          ..write('createdDate: $createdDate')
          ..write(')'))
        .toString();
  }
}

class $WalletsTable extends Wallets with TableInfo<$WalletsTable, Wallet> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WalletsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
      'total', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, total, createdDate];
  @override
  String get aliasedName => _alias ?? 'wallets';
  @override
  String get actualTableName => 'wallets';
  @override
  VerificationContext validateIntegrity(Insertable<Wallet> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Wallet map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Wallet(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
    );
  }

  @override
  $WalletsTable createAlias(String alias) {
    return $WalletsTable(attachedDatabase, alias);
  }
}

class Allocation extends DataClass implements Insertable<Allocation> {
  final int id;
  final String name;
  final int total;
  final DateTime createdDate;
  final int totalLastAllocation;
  final DateTime lastAllocationDate;
  const Allocation(
      {required this.id,
      required this.name,
      required this.total,
      required this.createdDate,
      required this.totalLastAllocation,
      required this.lastAllocationDate});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['total'] = Variable<int>(total);
    map['created_date'] = Variable<DateTime>(createdDate);
    map['total_last_allocation'] = Variable<int>(totalLastAllocation);
    map['last_allocation_date'] = Variable<DateTime>(lastAllocationDate);
    return map;
  }

  AllocationsCompanion toCompanion(bool nullToAbsent) {
    return AllocationsCompanion(
      id: Value(id),
      name: Value(name),
      total: Value(total),
      createdDate: Value(createdDate),
      totalLastAllocation: Value(totalLastAllocation),
      lastAllocationDate: Value(lastAllocationDate),
    );
  }

  factory Allocation.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Allocation(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      total: serializer.fromJson<int>(json['total']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      totalLastAllocation:
          serializer.fromJson<int>(json['totalLastAllocation']),
      lastAllocationDate:
          serializer.fromJson<DateTime>(json['lastAllocationDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'total': serializer.toJson<int>(total),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'totalLastAllocation': serializer.toJson<int>(totalLastAllocation),
      'lastAllocationDate': serializer.toJson<DateTime>(lastAllocationDate),
    };
  }

  Allocation copyWith(
          {int? id,
          String? name,
          int? total,
          DateTime? createdDate,
          int? totalLastAllocation,
          DateTime? lastAllocationDate}) =>
      Allocation(
        id: id ?? this.id,
        name: name ?? this.name,
        total: total ?? this.total,
        createdDate: createdDate ?? this.createdDate,
        totalLastAllocation: totalLastAllocation ?? this.totalLastAllocation,
        lastAllocationDate: lastAllocationDate ?? this.lastAllocationDate,
      );
  @override
  String toString() {
    return (StringBuffer('Allocation(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('total: $total, ')
          ..write('createdDate: $createdDate, ')
          ..write('totalLastAllocation: $totalLastAllocation, ')
          ..write('lastAllocationDate: $lastAllocationDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, total, createdDate, totalLastAllocation, lastAllocationDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Allocation &&
          other.id == this.id &&
          other.name == this.name &&
          other.total == this.total &&
          other.createdDate == this.createdDate &&
          other.totalLastAllocation == this.totalLastAllocation &&
          other.lastAllocationDate == this.lastAllocationDate);
}

class AllocationsCompanion extends UpdateCompanion<Allocation> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> total;
  final Value<DateTime> createdDate;
  final Value<int> totalLastAllocation;
  final Value<DateTime> lastAllocationDate;
  const AllocationsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.total = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.totalLastAllocation = const Value.absent(),
    this.lastAllocationDate = const Value.absent(),
  });
  AllocationsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int total,
    required DateTime createdDate,
    required int totalLastAllocation,
    required DateTime lastAllocationDate,
  })  : name = Value(name),
        total = Value(total),
        createdDate = Value(createdDate),
        totalLastAllocation = Value(totalLastAllocation),
        lastAllocationDate = Value(lastAllocationDate);
  static Insertable<Allocation> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? total,
    Expression<DateTime>? createdDate,
    Expression<int>? totalLastAllocation,
    Expression<DateTime>? lastAllocationDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (total != null) 'total': total,
      if (createdDate != null) 'created_date': createdDate,
      if (totalLastAllocation != null)
        'total_last_allocation': totalLastAllocation,
      if (lastAllocationDate != null)
        'last_allocation_date': lastAllocationDate,
    });
  }

  AllocationsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? total,
      Value<DateTime>? createdDate,
      Value<int>? totalLastAllocation,
      Value<DateTime>? lastAllocationDate}) {
    return AllocationsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      total: total ?? this.total,
      createdDate: createdDate ?? this.createdDate,
      totalLastAllocation: totalLastAllocation ?? this.totalLastAllocation,
      lastAllocationDate: lastAllocationDate ?? this.lastAllocationDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (totalLastAllocation.present) {
      map['total_last_allocation'] = Variable<int>(totalLastAllocation.value);
    }
    if (lastAllocationDate.present) {
      map['last_allocation_date'] =
          Variable<DateTime>(lastAllocationDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AllocationsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('total: $total, ')
          ..write('createdDate: $createdDate, ')
          ..write('totalLastAllocation: $totalLastAllocation, ')
          ..write('lastAllocationDate: $lastAllocationDate')
          ..write(')'))
        .toString();
  }
}

class $AllocationsTable extends Allocations
    with TableInfo<$AllocationsTable, Allocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AllocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
      'total', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _createdDateMeta =
      const VerificationMeta('createdDate');
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
      'created_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _totalLastAllocationMeta =
      const VerificationMeta('totalLastAllocation');
  @override
  late final GeneratedColumn<int> totalLastAllocation = GeneratedColumn<int>(
      'total_last_allocation', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastAllocationDateMeta =
      const VerificationMeta('lastAllocationDate');
  @override
  late final GeneratedColumn<DateTime> lastAllocationDate =
      GeneratedColumn<DateTime>('last_allocation_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, total, createdDate, totalLastAllocation, lastAllocationDate];
  @override
  String get aliasedName => _alias ?? 'allocations';
  @override
  String get actualTableName => 'allocations';
  @override
  VerificationContext validateIntegrity(Insertable<Allocation> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
          _createdDateMeta,
          createdDate.isAcceptableOrUnknown(
              data['created_date']!, _createdDateMeta));
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    if (data.containsKey('total_last_allocation')) {
      context.handle(
          _totalLastAllocationMeta,
          totalLastAllocation.isAcceptableOrUnknown(
              data['total_last_allocation']!, _totalLastAllocationMeta));
    } else if (isInserting) {
      context.missing(_totalLastAllocationMeta);
    }
    if (data.containsKey('last_allocation_date')) {
      context.handle(
          _lastAllocationDateMeta,
          lastAllocationDate.isAcceptableOrUnknown(
              data['last_allocation_date']!, _lastAllocationDateMeta));
    } else if (isInserting) {
      context.missing(_lastAllocationDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Allocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Allocation(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total'])!,
      createdDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_date'])!,
      totalLastAllocation: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}total_last_allocation'])!,
      lastAllocationDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}last_allocation_date'])!,
    );
  }

  @override
  $AllocationsTable createAlias(String alias) {
    return $AllocationsTable(attachedDatabase, alias);
  }
}

class History extends DataClass implements Insertable<History> {
  final int id;
  final int isSpending;
  final int walletId;
  final int total;
  final String note;
  final DateTime date;
  const History(
      {required this.id,
      required this.isSpending,
      required this.walletId,
      required this.total,
      required this.note,
      required this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['is_spending'] = Variable<int>(isSpending);
    map['wallet_id'] = Variable<int>(walletId);
    map['total'] = Variable<int>(total);
    map['note'] = Variable<String>(note);
    map['date'] = Variable<DateTime>(date);
    return map;
  }

  HistoriesCompanion toCompanion(bool nullToAbsent) {
    return HistoriesCompanion(
      id: Value(id),
      isSpending: Value(isSpending),
      walletId: Value(walletId),
      total: Value(total),
      note: Value(note),
      date: Value(date),
    );
  }

  factory History.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return History(
      id: serializer.fromJson<int>(json['id']),
      isSpending: serializer.fromJson<int>(json['isSpending']),
      walletId: serializer.fromJson<int>(json['walletId']),
      total: serializer.fromJson<int>(json['total']),
      note: serializer.fromJson<String>(json['note']),
      date: serializer.fromJson<DateTime>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'isSpending': serializer.toJson<int>(isSpending),
      'walletId': serializer.toJson<int>(walletId),
      'total': serializer.toJson<int>(total),
      'note': serializer.toJson<String>(note),
      'date': serializer.toJson<DateTime>(date),
    };
  }

  History copyWith(
          {int? id,
          int? isSpending,
          int? walletId,
          int? total,
          String? note,
          DateTime? date}) =>
      History(
        id: id ?? this.id,
        isSpending: isSpending ?? this.isSpending,
        walletId: walletId ?? this.walletId,
        total: total ?? this.total,
        note: note ?? this.note,
        date: date ?? this.date,
      );
  @override
  String toString() {
    return (StringBuffer('History(')
          ..write('id: $id, ')
          ..write('isSpending: $isSpending, ')
          ..write('walletId: $walletId, ')
          ..write('total: $total, ')
          ..write('note: $note, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, isSpending, walletId, total, note, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is History &&
          other.id == this.id &&
          other.isSpending == this.isSpending &&
          other.walletId == this.walletId &&
          other.total == this.total &&
          other.note == this.note &&
          other.date == this.date);
}

class HistoriesCompanion extends UpdateCompanion<History> {
  final Value<int> id;
  final Value<int> isSpending;
  final Value<int> walletId;
  final Value<int> total;
  final Value<String> note;
  final Value<DateTime> date;
  const HistoriesCompanion({
    this.id = const Value.absent(),
    this.isSpending = const Value.absent(),
    this.walletId = const Value.absent(),
    this.total = const Value.absent(),
    this.note = const Value.absent(),
    this.date = const Value.absent(),
  });
  HistoriesCompanion.insert({
    this.id = const Value.absent(),
    required int isSpending,
    required int walletId,
    required int total,
    required String note,
    required DateTime date,
  })  : isSpending = Value(isSpending),
        walletId = Value(walletId),
        total = Value(total),
        note = Value(note),
        date = Value(date);
  static Insertable<History> custom({
    Expression<int>? id,
    Expression<int>? isSpending,
    Expression<int>? walletId,
    Expression<int>? total,
    Expression<String>? note,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (isSpending != null) 'is_spending': isSpending,
      if (walletId != null) 'wallet_id': walletId,
      if (total != null) 'total': total,
      if (note != null) 'note': note,
      if (date != null) 'date': date,
    });
  }

  HistoriesCompanion copyWith(
      {Value<int>? id,
      Value<int>? isSpending,
      Value<int>? walletId,
      Value<int>? total,
      Value<String>? note,
      Value<DateTime>? date}) {
    return HistoriesCompanion(
      id: id ?? this.id,
      isSpending: isSpending ?? this.isSpending,
      walletId: walletId ?? this.walletId,
      total: total ?? this.total,
      note: note ?? this.note,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (isSpending.present) {
      map['is_spending'] = Variable<int>(isSpending.value);
    }
    if (walletId.present) {
      map['wallet_id'] = Variable<int>(walletId.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoriesCompanion(')
          ..write('id: $id, ')
          ..write('isSpending: $isSpending, ')
          ..write('walletId: $walletId, ')
          ..write('total: $total, ')
          ..write('note: $note, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

class $HistoriesTable extends Histories
    with TableInfo<$HistoriesTable, History> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _isSpendingMeta =
      const VerificationMeta('isSpending');
  @override
  late final GeneratedColumn<int> isSpending = GeneratedColumn<int>(
      'is_spending', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _walletIdMeta =
      const VerificationMeta('walletId');
  @override
  late final GeneratedColumn<int> walletId = GeneratedColumn<int>(
      'wallet_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
      'total', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, isSpending, walletId, total, note, date];
  @override
  String get aliasedName => _alias ?? 'histories';
  @override
  String get actualTableName => 'histories';
  @override
  VerificationContext validateIntegrity(Insertable<History> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('is_spending')) {
      context.handle(
          _isSpendingMeta,
          isSpending.isAcceptableOrUnknown(
              data['is_spending']!, _isSpendingMeta));
    } else if (isInserting) {
      context.missing(_isSpendingMeta);
    }
    if (data.containsKey('wallet_id')) {
      context.handle(_walletIdMeta,
          walletId.isAcceptableOrUnknown(data['wallet_id']!, _walletIdMeta));
    } else if (isInserting) {
      context.missing(_walletIdMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  History map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return History(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      isSpending: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_spending'])!,
      walletId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}wallet_id'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
    );
  }

  @override
  $HistoriesTable createAlias(String alias) {
    return $HistoriesTable(attachedDatabase, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $WalletsTable wallets = $WalletsTable(this);
  late final $AllocationsTable allocations = $AllocationsTable(this);
  late final $HistoriesTable histories = $HistoriesTable(this);
  late final WalletsDao walletsDao = WalletsDao(this as Database);
  late final HistoriesDao historiesDao = HistoriesDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [wallets, allocations, histories];
}
