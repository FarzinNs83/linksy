// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(profileRemote)
final profileRemoteProvider = ProfileRemoteProvider._();

final class ProfileRemoteProvider
    extends $FunctionalProvider<ProfileRemote, ProfileRemote, ProfileRemote>
    with $Provider<ProfileRemote> {
  ProfileRemoteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileRemoteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileRemoteHash();

  @$internal
  @override
  $ProviderElement<ProfileRemote> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProfileRemote create(Ref ref) {
    return profileRemote(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileRemote value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileRemote>(value),
    );
  }
}

String _$profileRemoteHash() => r'9be681d2fa635a4174501a7fff3fdf9e8f3259ce';

@ProviderFor(profileRepo)
final profileRepoProvider = ProfileRepoProvider._();

final class ProfileRepoProvider
    extends $FunctionalProvider<ProfileRepo, ProfileRepo, ProfileRepo>
    with $Provider<ProfileRepo> {
  ProfileRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileRepoHash();

  @$internal
  @override
  $ProviderElement<ProfileRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProfileRepo create(Ref ref) {
    return profileRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileRepo>(value),
    );
  }
}

String _$profileRepoHash() => r'e5de3f5c8961ab417f75160cf3328839ea1493bd';

@ProviderFor(profileUseCase)
final profileUseCaseProvider = ProfileUseCaseProvider._();

final class ProfileUseCaseProvider
    extends $FunctionalProvider<ProfileUseCase, ProfileUseCase, ProfileUseCase>
    with $Provider<ProfileUseCase> {
  ProfileUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileUseCaseHash();

  @$internal
  @override
  $ProviderElement<ProfileUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProfileUseCase create(Ref ref) {
    return profileUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProfileUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProfileUseCase>(value),
    );
  }
}

String _$profileUseCaseHash() => r'dd9760a9a1cdd18e15e5424a50c1fbce911c937b';
