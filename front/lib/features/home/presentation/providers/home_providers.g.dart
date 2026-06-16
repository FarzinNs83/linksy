// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(homeRemote)
final homeRemoteProvider = HomeRemoteProvider._();

final class HomeRemoteProvider
    extends $FunctionalProvider<HomeRemote, HomeRemote, HomeRemote>
    with $Provider<HomeRemote> {
  HomeRemoteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRemoteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRemoteHash();

  @$internal
  @override
  $ProviderElement<HomeRemote> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeRemote create(Ref ref) {
    return homeRemote(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeRemote value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeRemote>(value),
    );
  }
}

String _$homeRemoteHash() => r'ef761e14da7d376be8d4d657f4eae448842a8a76';

@ProviderFor(homeRepo)
final homeRepoProvider = HomeRepoProvider._();

final class HomeRepoProvider
    extends $FunctionalProvider<HomeRepo, HomeRepo, HomeRepo>
    with $Provider<HomeRepo> {
  HomeRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRepoHash();

  @$internal
  @override
  $ProviderElement<HomeRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeRepo create(Ref ref) {
    return homeRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeRepo>(value),
    );
  }
}

String _$homeRepoHash() => r'b284dcfcac0f5eca16886e12f03fb21d6ac06185';

@ProviderFor(homeUseCase)
final homeUseCaseProvider = HomeUseCaseProvider._();

final class HomeUseCaseProvider
    extends $FunctionalProvider<HomeUseCase, HomeUseCase, HomeUseCase>
    with $Provider<HomeUseCase> {
  HomeUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeUseCaseHash();

  @$internal
  @override
  $ProviderElement<HomeUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeUseCase create(Ref ref) {
    return homeUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeUseCase>(value),
    );
  }
}

String _$homeUseCaseHash() => r'a367576a78868dbeca9251c214f717f0297fe999';

@ProviderFor(getPosts)
final getPostsProvider = GetPostsProvider._();

final class GetPostsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<HomeEntity>>,
          List<HomeEntity>,
          FutureOr<List<HomeEntity>>
        >
    with $FutureModifier<List<HomeEntity>>, $FutureProvider<List<HomeEntity>> {
  GetPostsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPostsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPostsHash();

  @$internal
  @override
  $FutureProviderElement<List<HomeEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<HomeEntity>> create(Ref ref) {
    return getPosts(ref);
  }
}

String _$getPostsHash() => r'6d7f5ecc5efab58f978e9e7289072426439e18ec';

@ProviderFor(getUser)
final getUserProvider = GetUserFamily._();

final class GetUserProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserDetailEntity>,
          UserDetailEntity,
          FutureOr<UserDetailEntity>
        >
    with $FutureModifier<UserDetailEntity>, $FutureProvider<UserDetailEntity> {
  GetUserProvider._({
    required GetUserFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getUserProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getUserHash();

  @override
  String toString() {
    return r'getUserProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<UserDetailEntity> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserDetailEntity> create(Ref ref) {
    final argument = this.argument as String;
    return getUser(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getUserHash() => r'885e59f159729c55c12fd1304a7317a79b45683d';

final class GetUserFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<UserDetailEntity>, String> {
  GetUserFamily._()
    : super(
        retry: null,
        name: r'getUserProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  GetUserProvider call(String id) =>
      GetUserProvider._(argument: id, from: this);

  @override
  String toString() => r'getUserProvider';
}
