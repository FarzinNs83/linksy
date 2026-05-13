// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRemote)
final authRemoteProvider = AuthRemoteProvider._();

final class AuthRemoteProvider
    extends $FunctionalProvider<AuthRemote, AuthRemote, AuthRemote>
    with $Provider<AuthRemote> {
  AuthRemoteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteHash();

  @$internal
  @override
  $ProviderElement<AuthRemote> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRemote create(Ref ref) {
    return authRemote(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRemote value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRemote>(value),
    );
  }
}

String _$authRemoteHash() => r'363b40a7b06cb407ee02474b7e6256150e40fd59';

@ProviderFor(authRepo)
final authRepoProvider = AuthRepoProvider._();

final class AuthRepoProvider
    extends $FunctionalProvider<AuthRepo, AuthRepo, AuthRepo>
    with $Provider<AuthRepo> {
  AuthRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepoHash();

  @$internal
  @override
  $ProviderElement<AuthRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepo create(Ref ref) {
    return authRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepo>(value),
    );
  }
}

String _$authRepoHash() => r'4bb7cd5f61aef1b09c18d48fadccec80ee1e2bac';

@ProviderFor(authUseCase)
final authUseCaseProvider = AuthUseCaseProvider._();

final class AuthUseCaseProvider
    extends $FunctionalProvider<AuthUseCase, AuthUseCase, AuthUseCase>
    with $Provider<AuthUseCase> {
  AuthUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authUseCaseHash();

  @$internal
  @override
  $ProviderElement<AuthUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthUseCase create(Ref ref) {
    return authUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthUseCase>(value),
    );
  }
}

String _$authUseCaseHash() => r'5a2f0c61274fd59a9e9e28ed875d4eda94e0e1dc';

@ProviderFor(AuthController)
final authControllerProvider = AuthControllerProvider._();

final class AuthControllerProvider
    extends $AsyncNotifierProvider<AuthController, void> {
  AuthControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authControllerHash();

  @$internal
  @override
  AuthController create() => AuthController();
}

String _$authControllerHash() => r'9913ad93ead763077fe0f064e663583aa969dab7';

abstract class _$AuthController extends $AsyncNotifier<void> {
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
