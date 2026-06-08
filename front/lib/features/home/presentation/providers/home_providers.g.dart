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

@ProviderFor(publishPost)
final publishPostProvider = PublishPostFamily._();

final class PublishPostProvider
    extends
        $FunctionalProvider<
          AsyncValue<HomeEntity>,
          HomeEntity,
          FutureOr<HomeEntity>
        >
    with $FutureModifier<HomeEntity>, $FutureProvider<HomeEntity> {
  PublishPostProvider._({
    required PublishPostFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'publishPostProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$publishPostHash();

  @override
  String toString() {
    return r'publishPostProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<HomeEntity> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HomeEntity> create(Ref ref) {
    final argument = this.argument as String;
    return publishPost(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PublishPostProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$publishPostHash() => r'721df60faa7b9dc11172b53ff43bf86d75324dfc';

final class PublishPostFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<HomeEntity>, String> {
  PublishPostFamily._()
    : super(
        retry: null,
        name: r'publishPostProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  PublishPostProvider call(String id) =>
      PublishPostProvider._(argument: id, from: this);

  @override
  String toString() => r'publishPostProvider';
}

@ProviderFor(deletePost)
final deletePostProvider = DeletePostFamily._();

final class DeletePostProvider
    extends
        $FunctionalProvider<
          AsyncValue<HomeEntity>,
          HomeEntity,
          FutureOr<HomeEntity>
        >
    with $FutureModifier<HomeEntity>, $FutureProvider<HomeEntity> {
  DeletePostProvider._({
    required DeletePostFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'deletePostProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$deletePostHash();

  @override
  String toString() {
    return r'deletePostProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<HomeEntity> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<HomeEntity> create(Ref ref) {
    final argument = this.argument as String;
    return deletePost(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DeletePostProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$deletePostHash() => r'fb257a0b6e91ddff0eebd776c1e82b6251a4cb9f';

final class DeletePostFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<HomeEntity>, String> {
  DeletePostFamily._()
    : super(
        retry: null,
        name: r'deletePostProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  DeletePostProvider call(String id) =>
      DeletePostProvider._(argument: id, from: this);

  @override
  String toString() => r'deletePostProvider';
}
