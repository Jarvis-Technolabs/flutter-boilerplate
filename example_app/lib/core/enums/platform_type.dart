const String PLAT_ANDROID = "android";
const String PLAT_IOS = "ios";

enum PlatformType { Android, Ios }

extension EnumExtensions on PlatformType {
  String? get name {
    switch (this) {
      case PlatformType.Android:
        return PLAT_ANDROID;
      case PlatformType.Ios:
        return PLAT_IOS;
      default:
        return null;
    }
  }
}

extension EnumExtensionsVal on String {
  PlatformType? platformTypeVal() {
    switch (this) {
      case PLAT_ANDROID:
        return PlatformType.Android;

      case PLAT_IOS:
        return PlatformType.Ios;

      default:
        return null;
    }
  }
}
