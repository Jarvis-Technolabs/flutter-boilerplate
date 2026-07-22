import 'package:flutter/material.dart';

/// Abstract base class for text animations.
abstract class AnimatedText {
  final String text;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final Duration duration;
  final Characters textCharacters;

  AnimatedText({
    required this.text,
    this.textAlign = TextAlign.start,
    this.textStyle,
    required this.duration,
  }) : textCharacters = text.characters;

  Duration? get remaining => null;

  void initAnimation(AnimationController controller);
  void nextTextColorAnimation(Color textColor);
  void checkAnimationState(AnimationStatus status);

  Widget textWidget(String data, TextStyle style) => Text(
        data,
        textAlign: textAlign,
        style: style,
      );

  Widget completeText(BuildContext context) {
    TextStyle style = TextStyle(color: Colors.red);
    return textWidget(text, style);
  }

  Widget animatedBuilder(BuildContext context, Widget? child);
}
