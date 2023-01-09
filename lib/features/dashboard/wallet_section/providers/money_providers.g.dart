// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_providers.dart';

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

String _$netWorthHash() => r'924909f9ff7e3be6283ffd96ae45582b8ffdfa00';

/// See also [netWorth].
final netWorthProvider = AutoDisposeFutureProvider<double>(
  netWorth,
  name: r'netWorthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$netWorthHash,
);
typedef NetWorthRef = AutoDisposeFutureProviderRef<double>;
String _$netWorthExcludingAllocationHash() =>
    r'420e19580079dfadce0979600949b5faf8ce7db1';

/// See also [netWorthExcludingAllocation].
final netWorthExcludingAllocationProvider = AutoDisposeFutureProvider<double>(
  netWorthExcludingAllocation,
  name: r'netWorthExcludingAllocationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$netWorthExcludingAllocationHash,
);
typedef NetWorthExcludingAllocationRef = AutoDisposeFutureProviderRef<double>;
