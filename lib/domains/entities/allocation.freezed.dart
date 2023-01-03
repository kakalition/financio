// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'allocation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Allocation {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  DateTime get lastAllocationDate => throw _privateConstructorUsedError;
  int get totalLastAllocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllocationCopyWith<Allocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllocationCopyWith<$Res> {
  factory $AllocationCopyWith(
          Allocation value, $Res Function(Allocation) then) =
      _$AllocationCopyWithImpl<$Res, Allocation>;
  @useResult
  $Res call(
      {int id,
      String name,
      int total,
      DateTime lastAllocationDate,
      int totalLastAllocation});
}

/// @nodoc
class _$AllocationCopyWithImpl<$Res, $Val extends Allocation>
    implements $AllocationCopyWith<$Res> {
  _$AllocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? total = null,
    Object? lastAllocationDate = null,
    Object? totalLastAllocation = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      lastAllocationDate: null == lastAllocationDate
          ? _value.lastAllocationDate
          : lastAllocationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalLastAllocation: null == totalLastAllocation
          ? _value.totalLastAllocation
          : totalLastAllocation // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AllocationCopyWith<$Res>
    implements $AllocationCopyWith<$Res> {
  factory _$$_AllocationCopyWith(
          _$_Allocation value, $Res Function(_$_Allocation) then) =
      __$$_AllocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      int total,
      DateTime lastAllocationDate,
      int totalLastAllocation});
}

/// @nodoc
class __$$_AllocationCopyWithImpl<$Res>
    extends _$AllocationCopyWithImpl<$Res, _$_Allocation>
    implements _$$_AllocationCopyWith<$Res> {
  __$$_AllocationCopyWithImpl(
      _$_Allocation _value, $Res Function(_$_Allocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? total = null,
    Object? lastAllocationDate = null,
    Object? totalLastAllocation = null,
  }) {
    return _then(_$_Allocation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      lastAllocationDate: null == lastAllocationDate
          ? _value.lastAllocationDate
          : lastAllocationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalLastAllocation: null == totalLastAllocation
          ? _value.totalLastAllocation
          : totalLastAllocation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Allocation implements _Allocation {
  const _$_Allocation(
      {required this.id,
      required this.name,
      required this.total,
      required this.lastAllocationDate,
      required this.totalLastAllocation});

  @override
  final int id;
  @override
  final String name;
  @override
  final int total;
  @override
  final DateTime lastAllocationDate;
  @override
  final int totalLastAllocation;

  @override
  String toString() {
    return 'Allocation(id: $id, name: $name, total: $total, lastAllocationDate: $lastAllocationDate, totalLastAllocation: $totalLastAllocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Allocation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.lastAllocationDate, lastAllocationDate) ||
                other.lastAllocationDate == lastAllocationDate) &&
            (identical(other.totalLastAllocation, totalLastAllocation) ||
                other.totalLastAllocation == totalLastAllocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, total, lastAllocationDate, totalLastAllocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllocationCopyWith<_$_Allocation> get copyWith =>
      __$$_AllocationCopyWithImpl<_$_Allocation>(this, _$identity);
}

abstract class _Allocation implements Allocation {
  const factory _Allocation(
      {required final int id,
      required final String name,
      required final int total,
      required final DateTime lastAllocationDate,
      required final int totalLastAllocation}) = _$_Allocation;

  @override
  int get id;
  @override
  String get name;
  @override
  int get total;
  @override
  DateTime get lastAllocationDate;
  @override
  int get totalLastAllocation;
  @override
  @JsonKey(ignore: true)
  _$$_AllocationCopyWith<_$_Allocation> get copyWith =>
      throw _privateConstructorUsedError;
}
