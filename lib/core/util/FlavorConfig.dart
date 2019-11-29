import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Flavor { DEV, STAGING, PROD }

class FlavorConfig {
  final Flavor flavor;
  final String baseUrl;
  static FlavorConfig _instance;

  factory FlavorConfig({@required Flavor flavor, String baseUrl}) {
    _instance ??= FlavorConfig._internal(flavor, baseUrl);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.baseUrl);

  static FlavorConfig get instance => _instance;

  static bool isProd() => _instance.flavor == Flavor.PROD;

  static bool isDev() => _instance.flavor == Flavor.DEV;

  static bool isStaging() => _instance.flavor == Flavor.STAGING;
}
