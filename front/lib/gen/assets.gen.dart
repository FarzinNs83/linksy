// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/ananas.jpeg
  AssetGenImage get ananas => const AssetGenImage('assets/png/ananas.jpeg');

  /// File path: assets/png/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/png/background.png');

  /// File path: assets/png/clock.png
  AssetGenImage get clock => const AssetGenImage('assets/png/clock.png');

  /// File path: assets/png/light-1.png
  AssetGenImage get light1 => const AssetGenImage('assets/png/light-1.png');

  /// File path: assets/png/light-2.png
  AssetGenImage get light2 => const AssetGenImage('assets/png/light-2.png');

  /// File path: assets/png/login_bottom.png
  AssetGenImage get loginBottom =>
      const AssetGenImage('assets/png/login_bottom.png');

  /// File path: assets/png/main_bottom.png
  AssetGenImage get mainBottom =>
      const AssetGenImage('assets/png/main_bottom.png');

  /// File path: assets/png/main_top.png
  AssetGenImage get mainTop => const AssetGenImage('assets/png/main_top.png');

  /// File path: assets/png/profile.jpg
  AssetGenImage get profile => const AssetGenImage('assets/png/profile.jpg');

  /// File path: assets/png/signup_top.png
  AssetGenImage get signupTop =>
      const AssetGenImage('assets/png/signup_top.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    ananas,
    background,
    clock,
    light1,
    light2,
    loginBottom,
    mainBottom,
    mainTop,
    profile,
    signupTop,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/chat.svg
  String get chat => 'assets/svg/chat.svg';

  /// File path: assets/svg/facebook.svg
  String get facebook => 'assets/svg/facebook.svg';

  /// File path: assets/svg/google-plus.svg
  String get googlePlus => 'assets/svg/google-plus.svg';

  /// File path: assets/svg/login.svg
  String get login => 'assets/svg/login.svg';

  /// File path: assets/svg/signup.svg
  String get signup => 'assets/svg/signup.svg';

  /// File path: assets/svg/twitter.svg
  String get twitter => 'assets/svg/twitter.svg';

  /// List of all assets
  List<String> get values => [
    chat,
    facebook,
    googlePlus,
    login,
    signup,
    twitter,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
