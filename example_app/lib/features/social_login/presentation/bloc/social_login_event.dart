import 'package:flutter/foundation.dart';

@immutable
abstract class SocialLoginEvent {}

class CallGoogleSignInEvent extends SocialLoginEvent {}

class CallAppleSignInEvent extends SocialLoginEvent {}
