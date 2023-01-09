// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'financio_proviers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$isarHash() => r'f4b62670825038904ef7482722ae7fe82bb2ec20';

/// See also [isar].
final isarProvider = AutoDisposeFutureProvider<Isar>(
  isar,
  name: r'isarProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isarHash,
);
typedef IsarRef = AutoDisposeFutureProviderRef<Isar>;
String _$walletRepositoryHash() => r'547e7cff60903bd72ee08dcf803bb1b7bbdcbf3e';

/// See also [walletRepository].
final walletRepositoryProvider = AutoDisposeFutureProvider<WalletRepository>(
  walletRepository,
  name: r'walletRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$walletRepositoryHash,
);
typedef WalletRepositoryRef = AutoDisposeFutureProviderRef<WalletRepository>;
String _$walletsHash() => r'0b86184693684e1495ed07d2aa9bd7277baafb07';

/// See also [wallets].
final walletsProvider = AutoDisposeFutureProvider<List<Wallets>>(
  wallets,
  name: r'walletsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$walletsHash,
);
typedef WalletsRef = AutoDisposeFutureProviderRef<List<Wallets>>;
String _$allocationRepositoryHash() =>
    r'4cf7d2faca4ca3d2293b08c1290b17712bac5794';

/// See also [allocationRepository].
final allocationRepositoryProvider =
    AutoDisposeFutureProvider<AllocationRepository>(
  allocationRepository,
  name: r'allocationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$allocationRepositoryHash,
);
typedef AllocationRepositoryRef
    = AutoDisposeFutureProviderRef<AllocationRepository>;
String _$allocationsHash() => r'a5ea0ef5434f0960995c605331d41c42b73e5e7e';

/// See also [allocations].
final allocationsProvider = AutoDisposeFutureProvider<List<Allocations>>(
  allocations,
  name: r'allocationsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allocationsHash,
);
typedef AllocationsRef = AutoDisposeFutureProviderRef<List<Allocations>>;
String _$historyRepositoryHash() => r'511074a460f6b39830821103b0d85f3f943449f1';

/// See also [historyRepository].
final historyRepositoryProvider = AutoDisposeFutureProvider<HistoryRepository>(
  historyRepository,
  name: r'historyRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$historyRepositoryHash,
);
typedef HistoryRepositoryRef = AutoDisposeFutureProviderRef<HistoryRepository>;
String _$historiesHash() => r'931c3e5491b433fc221f37d880f28b3b26ffc7e8';

/// See also [histories].
final historiesProvider = AutoDisposeFutureProvider<List<Histories>>(
  histories,
  name: r'historiesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$historiesHash,
);
typedef HistoriesRef = AutoDisposeFutureProviderRef<List<Histories>>;
String _$latestHistoriesHash() => r'f04e59f2ff67864679fc7ce08b87c5a5922a00db';

/// See also [latestHistories].
final latestHistoriesProvider = AutoDisposeFutureProvider<List<Histories>>(
  latestHistories,
  name: r'latestHistoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$latestHistoriesHash,
);
typedef LatestHistoriesRef = AutoDisposeFutureProviderRef<List<Histories>>;
String _$rangedHistoriesHash() => r'2296b705aa8a8315e7fc6a1ab0a36ce052893cb0';

/// See also [rangedHistories].
class RangedHistoriesProvider
    extends AutoDisposeFutureProvider<List<Histories>> {
  RangedHistoriesProvider(
    this.dateTimeRange,
  ) : super(
          (ref) => rangedHistories(
            ref,
            dateTimeRange,
          ),
          from: rangedHistoriesProvider,
          name: r'rangedHistoriesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rangedHistoriesHash,
        );

  final DateTimeRange dateTimeRange;

  @override
  bool operator ==(Object other) {
    return other is RangedHistoriesProvider &&
        other.dateTimeRange == dateTimeRange;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dateTimeRange.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef RangedHistoriesRef = AutoDisposeFutureProviderRef<List<Histories>>;

/// See also [rangedHistories].
final rangedHistoriesProvider = RangedHistoriesFamily();

class RangedHistoriesFamily extends Family<AsyncValue<List<Histories>>> {
  RangedHistoriesFamily();

  RangedHistoriesProvider call(
    DateTimeRange dateTimeRange,
  ) {
    return RangedHistoriesProvider(
      dateTimeRange,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Histories>> getProviderOverride(
    covariant RangedHistoriesProvider provider,
  ) {
    return call(
      provider.dateTimeRange,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'rangedHistoriesProvider';
}

String _$rangedHistoriesStreamHash() =>
    r'cae9d29e740012bd291af0198d610764b2df1751';

/// See also [rangedHistoriesStream].
class RangedHistoriesStreamProvider
    extends AutoDisposeFutureProvider<List<Histories>> {
  RangedHistoriesStreamProvider(
    this.dateTimeRange,
  ) : super(
          (ref) => rangedHistoriesStream(
            ref,
            dateTimeRange,
          ),
          from: rangedHistoriesStreamProvider,
          name: r'rangedHistoriesStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$rangedHistoriesStreamHash,
        );

  final DateTimeRange dateTimeRange;

  @override
  bool operator ==(Object other) {
    return other is RangedHistoriesStreamProvider &&
        other.dateTimeRange == dateTimeRange;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dateTimeRange.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef RangedHistoriesStreamRef
    = AutoDisposeFutureProviderRef<List<Histories>>;

/// See also [rangedHistoriesStream].
final rangedHistoriesStreamProvider = RangedHistoriesStreamFamily();

class RangedHistoriesStreamFamily extends Family<AsyncValue<List<Histories>>> {
  RangedHistoriesStreamFamily();

  RangedHistoriesStreamProvider call(
    DateTimeRange dateTimeRange,
  ) {
    return RangedHistoriesStreamProvider(
      dateTimeRange,
    );
  }

  @override
  AutoDisposeFutureProvider<List<Histories>> getProviderOverride(
    covariant RangedHistoriesStreamProvider provider,
  ) {
    return call(
      provider.dateTimeRange,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'rangedHistoriesStreamProvider';
}

String _$transactionRepositoryHash() =>
    r'aa8b2324477a284db87bc383ef950e736910c451';

/// See also [transactionRepository].
final transactionRepositoryProvider =
    AutoDisposeFutureProvider<TransactionRepository>(
  transactionRepository,
  name: r'transactionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionRepositoryHash,
);
typedef TransactionRepositoryRef
    = AutoDisposeFutureProviderRef<TransactionRepository>;
