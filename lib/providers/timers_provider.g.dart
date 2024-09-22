// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$timerHash() => r'96b3f64a5f863535d484dc37315aea6135087030';

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

/// See also [timer].
@ProviderFor(timer)
const timerProvider = TimerFamily();

/// See also [timer].
class TimerFamily extends Family<TimerModel> {
  /// See also [timer].
  const TimerFamily();

  /// See also [timer].
  TimerProvider call({
    required int id,
  }) {
    return TimerProvider(
      id: id,
    );
  }

  @override
  TimerProvider getProviderOverride(
    covariant TimerProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'timerProvider';
}

/// See also [timer].
class TimerProvider extends AutoDisposeProvider<TimerModel> {
  /// See also [timer].
  TimerProvider({
    required int id,
  }) : this._internal(
          (ref) => timer(
            ref as TimerRef,
            id: id,
          ),
          from: timerProvider,
          name: r'timerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$timerHash,
          dependencies: TimerFamily._dependencies,
          allTransitiveDependencies: TimerFamily._allTransitiveDependencies,
          id: id,
        );

  TimerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    TimerModel Function(TimerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TimerProvider._internal(
        (ref) => create(ref as TimerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<TimerModel> createElement() {
    return _TimerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TimerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TimerRef on AutoDisposeProviderRef<TimerModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _TimerProviderElement extends AutoDisposeProviderElement<TimerModel>
    with TimerRef {
  _TimerProviderElement(super.provider);

  @override
  int get id => (origin as TimerProvider).id;
}

String _$timerManagerHash() => r'50f5ee05452d9a5342cad1bb107c7f13a12e7ef7';

/// See also [TimerManager].
@ProviderFor(TimerManager)
final timerManagerProvider =
    AutoDisposeNotifierProvider<TimerManager, Map<int, TimerModel>>.internal(
  TimerManager.new,
  name: r'timerManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$timerManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TimerManager = AutoDisposeNotifier<Map<int, TimerModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
