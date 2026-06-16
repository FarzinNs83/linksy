// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingsRemote)
final settingsRemoteProvider = SettingsRemoteProvider._();

final class SettingsRemoteProvider
    extends $FunctionalProvider<SettingsRemote, SettingsRemote, SettingsRemote>
    with $Provider<SettingsRemote> {
  SettingsRemoteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRemoteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRemoteHash();

  @$internal
  @override
  $ProviderElement<SettingsRemote> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsRemote create(Ref ref) {
    return settingsRemote(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRemote value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRemote>(value),
    );
  }
}

String _$settingsRemoteHash() => r'93f9494248031af2e2d686b14fd12e3c8f9835ac';

@ProviderFor(settingsRepo)
final settingsRepoProvider = SettingsRepoProvider._();

final class SettingsRepoProvider
    extends $FunctionalProvider<SettingsRepo, SettingsRepo, SettingsRepo>
    with $Provider<SettingsRepo> {
  SettingsRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRepoHash();

  @$internal
  @override
  $ProviderElement<SettingsRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsRepo create(Ref ref) {
    return settingsRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRepo>(value),
    );
  }
}

String _$settingsRepoHash() => r'db7624366d1d9fccfc7a93e7bf65862da49ac0a3';

@ProviderFor(settingsUseCase)
final settingsUseCaseProvider = SettingsUseCaseProvider._();

final class SettingsUseCaseProvider
    extends
        $FunctionalProvider<SettingsUseCase, SettingsUseCase, SettingsUseCase>
    with $Provider<SettingsUseCase> {
  SettingsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsUseCaseHash();

  @$internal
  @override
  $ProviderElement<SettingsUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsUseCase create(Ref ref) {
    return settingsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsUseCase>(value),
    );
  }
}

String _$settingsUseCaseHash() => r'421389f351fd1005bb41bae59acc8f5e7b1d8388';

@ProviderFor(UpdateUser)
final updateUserProvider = UpdateUserProvider._();

final class UpdateUserProvider
    extends $AsyncNotifierProvider<UpdateUser, void> {
  UpdateUserProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'updateUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$updateUserHash();

  @$internal
  @override
  UpdateUser create() => UpdateUser();
}

String _$updateUserHash() => r'60c4465ef2da02a0187c232d5d7e252b094806ee';

abstract class _$UpdateUser extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
