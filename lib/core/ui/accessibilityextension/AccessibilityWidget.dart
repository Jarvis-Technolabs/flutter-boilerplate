import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

// This extension is used for accessibility. Accessibility is for blind people. It is also said as screen readers.
// It is used for speaking something for blind people to understand what is they doing.
// It is used talkback for android and voiceover for IOS to speak.
// First turn on talkback in android & voiceover for IOS and then run the app.
// Some of methods for using talkback:
// 1. Swipe Left to Right for next control.
// 2. Swipe Right to Left for previous control.
// 3. Single Tap on any control to select that control.
// 4. Double Tap on anywhere in screen for clicking selected control.
//
// This extension is used to wrap any widget to semantics widget. Semantics widget is used to define some widget as button, toggle button,
// text, container, exclude any widget, textfield, etc for accessibility.
//
// Like
// TextField().setTextFieldSemantics();
// Container().setSemantics();
// Text().setSemantics();
// Icon().setSemanticsImage();
// Column().setSemantics();
// Accessibility has also method for speaking globally to recognize any events.
// Like SemanticsService.announce(text, TextDirection.ltr); // text is string to speaking.

/// ------------------------------------------------------------
/// GLOBAL ACCESSIBILITY CHECK
/// ------------------------------------------------------------
bool get _isScreenReaderEnabled => WidgetsBinding
    .instance.platformDispatcher.accessibilityFeatures.accessibleNavigation;

/// ------------------------------------------------------------
/// WIDGET EXTENSIONS (SAFE – UI NEVER HIDES)
/// ------------------------------------------------------------
extension Accessibility on Widget {
  /// IMAGE / ICON
  Widget setSemanticsImage({String? label}) {
    if (!_isScreenReaderEnabled) return this;

    return Semantics(
      image: true,
      label: label,
      excludeSemantics: true,
      child: this,
    );
  }

  /// BASIC CONTAINER
  Widget setSemantics({
    required bool container,
  }) {
    if (!_isScreenReaderEnabled) return this;
    return Semantics.fromProperties(
          properties: SemanticsProperties(), container: container, child: this);
    }

  /// LABEL OVERRIDE
  Widget setSemanticsLabel({String? label, bool container = true}) {
    if (!_isScreenReaderEnabled) return this;

    return Semantics(
      label: label,
      container: container,
      excludeSemantics: true,
      child: this,
    );
  }

  /// MERGE CHILD SEMANTICS
  Widget setSemanticsMerge() {
    if (!_isScreenReaderEnabled) return this;
    return MergeSemantics(child: this);
  }

  /// SWITCH / TOGGLE
  Widget setSemanticsSwitchButton({String? label}) {
    if (!_isScreenReaderEnabled) return this;

    return Semantics(
      toggled: true,
      button: true,
      label: label,
      excludeSemantics: true,
      child: this,
    );
  }

  /// BUTTON WITHOUT CHILD TEXT
  Widget setSemanticsButton({String? label}) {
    if (!_isScreenReaderEnabled) return this;

    return Semantics.fromProperties(
        properties: SemanticsProperties(button: true, label: label),
        container: true,
        excludeSemantics: true,
        explicitChildNodes: true,
        child: this);
  }

  /// BUTTON WITH CHILD TEXT + EXTRA HINT
  // this widget is speaking as screen having text, but additionally speaks with passing 'hint'.

  Widget setSemanticsButtonWithChild({String? hint}) {
    if (!_isScreenReaderEnabled) return this;

    return Semantics(
      button: true,
      hint: hint,
      child: this,
    );
  }

  /// LABEL + CHILD CONTENT
  // this widget is speaking as screen having text, but additionally speaks with passing 'label'.
  Widget setSemanticsLabelWithChild({String? label}) {
    if (!_isScreenReaderEnabled) return this;

    return Semantics.fromProperties(
        properties: SemanticsProperties(button: true, hint: label),
        container: true,
        child: this);
  }

  /// DECORATIVE UI (IGNORE FOR SCREEN READERS)
  Widget setDisableSemantics() {
    if (!_isScreenReaderEnabled) return this;

    return Semantics.fromProperties(
        properties: SemanticsProperties(),
        excludeSemantics: true,
        child: this);

  }

  /// TEXT FIELD
  Widget setTextFieldSemantics({String? label}) {
    if (!_isScreenReaderEnabled) return this;

    return Semantics.fromProperties(
        properties: SemanticsProperties(textField: true),
        excludeSemantics: false,
        child: this);
  }
}

/// ------------------------------------------------------------
/// STRING EXTENSION (OTP / MOBILE NUMBER)
/// ------------------------------------------------------------
extension AccessibilityString on String {
  String setMobileNumberAsText() {
    if (this.isEmpty) return this;

    String label = "";
    for (int i = 0; i < this.length; i++) {
      if (label.isNotEmpty) label += " ";
      label += this[i];
    }
    return label;
  }
}

/// ------------------------------------------------------------
/// GLOBAL ANNOUNCEMENTS
/// ------------------------------------------------------------
class AccessibilityMessages {
  static void announce(String text) {
    if (!_isScreenReaderEnabled) return;
    SemanticsService.announce(text, TextDirection.ltr);
  }
}
