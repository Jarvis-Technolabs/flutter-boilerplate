/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $LangGen {
  const $LangGen();

  /// File path: lang/lang_en.json
  String get langEn => 'lang/lang_en.json';

  /// File path: lang/lang_es.json
  String get langEs => 'lang/lang_es.json';

  /// List of all assets
  List<String> get values => [langEn, langEs];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesAppLogoGen get appLogo => const $AssetsImagesAppLogoGen();
  $AssetsImagesIconsGen get icons => const $AssetsImagesIconsGen();
  $AssetsImagesLottieAnimationGen get lottieAnimation =>
      const $AssetsImagesLottieAnimationGen();
  $AssetsImagesSplashGen get splash => const $AssetsImagesSplashGen();
}

class $AssetsMockJsonGen {
  const $AssetsMockJsonGen();

  /// File path: assets/mock_json/splash.json
  String get splash => 'assets/mock_json/splash.json';

  /// List of all assets
  List<String> get values => [splash];
}

class $AssetsImagesAppLogoGen {
  const $AssetsImagesAppLogoGen();

  /// File path: assets/images/app_logo/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo/app_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [appLogo];
}

class $AssetsImagesIconsGen {
  const $AssetsImagesIconsGen();

  /// File path: assets/images/icons/error.png
  AssetGenImage get error =>
      const AssetGenImage('assets/images/icons/error.png');

  /// File path: assets/images/icons/ic_hide_psw.png
  AssetGenImage get icHidePsw =>
      const AssetGenImage('assets/images/icons/ic_hide_psw.png');

  /// File path: assets/images/icons/ic_show_psw.png
  AssetGenImage get icShowPsw =>
      const AssetGenImage('assets/images/icons/ic_show_psw.png');

  /// File path: assets/images/icons/search.png
  AssetGenImage get search =>
      const AssetGenImage('assets/images/icons/search.png');

  /// List of all assets
  List<AssetGenImage> get values => [error, icHidePsw, icShowPsw, search];
}

class $AssetsImagesLottieAnimationGen {
  const $AssetsImagesLottieAnimationGen();

  /// File path: assets/images/lottie_animation/email_lottie_animation.json
  String get emailLottieAnimation =>
      'assets/images/lottie_animation/email_lottie_animation.json';

  /// List of all assets
  List<String> get values => [emailLottieAnimation];
}

class $AssetsImagesSplashGen {
  const $AssetsImagesSplashGen();

  /// File path: assets/images/splash/splash_background.png
  AssetGenImage get splashBackground =>
      const AssetGenImage('assets/images/splash/splash_background.png');

  /// List of all assets
  List<AssetGenImage> get values => [splashBackground];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsMockJsonGen mockJson = $AssetsMockJsonGen();
  static const $LangGen lang = $LangGen();
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
