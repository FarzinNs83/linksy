// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publish_post_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(publishpostRemote)
final publishpostRemoteProvider = PublishpostRemoteProvider._();

final class PublishpostRemoteProvider
    extends
        $FunctionalProvider<
          PublishPostRemote,
          PublishPostRemote,
          PublishPostRemote
        >
    with $Provider<PublishPostRemote> {
  PublishpostRemoteProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'publishpostRemoteProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$publishpostRemoteHash();

  @$internal
  @override
  $ProviderElement<PublishPostRemote> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PublishPostRemote create(Ref ref) {
    return publishpostRemote(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PublishPostRemote value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PublishPostRemote>(value),
    );
  }
}

String _$publishpostRemoteHash() => r'8f998a0c2b9c35ab8901435afc64dea79e2f820f';

@ProviderFor(publishpostRepo)
final publishpostRepoProvider = PublishpostRepoProvider._();

final class PublishpostRepoProvider
    extends
        $FunctionalProvider<PublishPostRepo, PublishPostRepo, PublishPostRepo>
    with $Provider<PublishPostRepo> {
  PublishpostRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'publishpostRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$publishpostRepoHash();

  @$internal
  @override
  $ProviderElement<PublishPostRepo> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PublishPostRepo create(Ref ref) {
    return publishpostRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PublishPostRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PublishPostRepo>(value),
    );
  }
}

String _$publishpostRepoHash() => r'a22eb8f79a81105e3b2d14291baaff85238c4fa3';

@ProviderFor(publishpostUseCase)
final publishpostUseCaseProvider = PublishpostUseCaseProvider._();

final class PublishpostUseCaseProvider
    extends
        $FunctionalProvider<
          PublishPostUseCase,
          PublishPostUseCase,
          PublishPostUseCase
        >
    with $Provider<PublishPostUseCase> {
  PublishpostUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'publishpostUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$publishpostUseCaseHash();

  @$internal
  @override
  $ProviderElement<PublishPostUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PublishPostUseCase create(Ref ref) {
    return publishpostUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PublishPostUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PublishPostUseCase>(value),
    );
  }
}

String _$publishpostUseCaseHash() =>
    r'cbec8135d416a38bd98a191a37443e9b908d5dde';

@ProviderFor(PublishPostCtrl)
final publishPostCtrlProvider = PublishPostCtrlProvider._();

final class PublishPostCtrlProvider
    extends $AsyncNotifierProvider<PublishPostCtrl, void> {
  PublishPostCtrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'publishPostCtrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$publishPostCtrlHash();

  @$internal
  @override
  PublishPostCtrl create() => PublishPostCtrl();
}

String _$publishPostCtrlHash() => r'68b6b02efe7e5b754ecd572545fdceb63db22ef8';

abstract class _$PublishPostCtrl extends $AsyncNotifier<void> {
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
