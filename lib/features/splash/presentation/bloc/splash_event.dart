import 'package:flutter/foundation.dart';

@immutable
abstract class SplashEvent {}

class FetchGetMobileConfigEventDataEvent extends SplashEvent {}

class PublicTokenEvent extends SplashEvent {}
