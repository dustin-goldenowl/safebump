/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesImagesGen get images => const $AssetsImagesImagesGen();
}

class $AssetsImagesImagesGen {
  const $AssetsImagesImagesGen();

  /// File path: assets/images/images/apple_logo.png
  AssetGenImage get appleLogo =>
      const AssetGenImage('assets/images/images/apple_logo.png');

  /// File path: assets/images/images/gg_logo.png
  AssetGenImage get ggLogo =>
      const AssetGenImage('assets/images/images/gg_logo.png');

  /// File path: assets/images/images/logo.png
  AssetGenImage get logo =>
      const AssetGenImage('assets/images/images/logo.png');

  /// File path: assets/images/images/provice_educational.png
  AssetGenImage get proviceEducational =>
      const AssetGenImage('assets/images/images/provice_educational.png');

  /// File path: assets/images/images/provide_community.png
  AssetGenImage get provideCommunity =>
      const AssetGenImage('assets/images/images/provide_community.png');

  /// File path: assets/images/images/provide_tracking.png
  AssetGenImage get provideTracking =>
      const AssetGenImage('assets/images/images/provide_tracking.png');

  /// File path: assets/images/images/schedule_manager.png
  AssetGenImage get scheduleManager =>
      const AssetGenImage('assets/images/images/schedule_manager.png');

  /// File path: assets/images/images/welcome_safebump.png
  AssetGenImage get welcomeSafebump =>
      const AssetGenImage('assets/images/images/welcome_safebump.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        appleLogo,
        ggLogo,
        logo,
        proviceEducational,
        provideCommunity,
        provideTracking,
        scheduleManager,
        welcomeSafebump
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
