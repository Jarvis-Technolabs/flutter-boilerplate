import 'package:flutter/material.dart';

import '../../const/app_constants.dart';

class ScreenUtil {
  static ScreenUtil? _instance;
  static const int defaultWidth = 375;
  static const int defaultHeight = 812;

  /// Size of the phone in UI Design , px
  late num uiWidthPx;
  late num uiHeightPx;

  /// allowFontScaling Specifies whether fonts should scale to respect Text Size accessibility settings. The default is false.
  bool? allowFontScaling;

  static MediaQueryData? _mediaQueryData;
  static double? _screenWidth;
  static double? _screenHeight;
  static double? _pixelRatio;
  static double? _statusBarHeight;
  static double? _bottomBarHeight;
  static double? _textScaleFactor;

  ScreenUtil._();

  factory ScreenUtil() {
    return _instance!;
  }

  static void init(
    BuildContext context, {
    num width = defaultWidth,
    num height = defaultHeight,
    bool allowFontScaling = false,
  }) {
    if (_instance == null) {
      _instance = ScreenUtil._();
    }
    _instance!.uiWidthPx = width;
    _instance!.uiHeightPx = height;
    _instance!.allowFontScaling = allowFontScaling;

    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = _mediaQueryData!.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  static MediaQueryData? get mediaQueryData => _mediaQueryData;

  /// The number of font pixels for each logical pixel.
  static double? get textScaleFactor => _textScaleFactor;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  static double? get pixelRatio => _pixelRatio;

  /// The horizontal extent of this size.
  static double? get screenWidthDp => _screenWidth;

  ///The vertical extent of this size. dp
  static double? get screenHeightDp => _screenHeight;

  /// The vertical extent of this size. px
  double get screenWidth => _screenWidth! * _pixelRatio!;

  /// The vertical extent of this size. px
  static double get screenHeight => _screenHeight! * _pixelRatio!;

  /// The offset from the top
  static double? get statusBarHeight => _statusBarHeight;

  /// The offset from the bottom.
  static double? get bottomBarHeight => _bottomBarHeight;

  /// The ratio of the actual dp to the design draft px
  double get scaleWidth => _screenWidth! / uiWidthPx;

  double get scaleHeight => _screenHeight! / uiHeightPx;

  double get scaleText => scaleWidth;

  double? get deviceScreenWidth => _screenWidth;

  /// Adapted to the device_info width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  double setWidth(double width) =>
      checkTablet() ? width.toDouble() : width * scaleWidth;

  /// Highly adaptable to the device_info according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current text_style_extension effect, or if there is a difference in shape.
  double setHeight(double height) =>
      checkTablet() ? height.toDouble() : height * scaleHeight;

  ///Font size adaptation method
  ///@param [fontSize] The size of the font on the UI design, in px.
  ///@param [allowFontScaling]
  double setSp(
    double fontSize, {
    bool? allowFontScalingSelf,
    bool isEnglish = false,
    bool isPrint = false,
  }) =>
      checkTablet() ? fontSize.toDouble() + 10 : (fontSize) * scaleText;

  bool checkTablet() => _screenWidth! >= TABLET_DEVICE_WIDTH;
}
