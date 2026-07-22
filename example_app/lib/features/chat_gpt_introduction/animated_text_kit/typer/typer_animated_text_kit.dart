import 'package:example_app/features/chat_gpt_introduction/animated_text_kit/animated_text_widget/animated_text_kit_widget.dart';
import 'package:flutter/material.dart';

import '../animated_text_widget/animated_text.dart';
import 'typer_widget/typer_animated_text.dart';

class TyperAnimatedTextKit extends AnimatedTextKit {
  TyperAnimatedTextKit({
    Key? key,
    required List<String> text,
    TextAlign textAlign = TextAlign.start,
    TextStyle? textStyle,
    required List<Color> textColors,
    Duration speed = const Duration(milliseconds: 40),
    Duration pause = const Duration(milliseconds: 1000),
    bool displayFullTextOnTap = false,
    bool stopPauseOnTap = false,
    VoidCallback? onTap,
    void Function(int, bool)? onNext,
    void Function(int, bool)? onNextBeforePause,
    VoidCallback? onFinished,
    bool isRepeatingAnimation = true,
    bool repeatForever = true,
    int totalRepeatCount = 3,
    Curve curve = Curves.linear,
  }) : super(
          key: key,
          animatedTexts:
              _animatedTexts(text, textAlign, textStyle, speed, curve),
          textColors: textColors,
          pause: pause,
          displayFullTextOnTap: displayFullTextOnTap,
          stopPauseOnTap: stopPauseOnTap,
          onTap: onTap,
          onNext: onNext,
          onNextBeforePause: onNextBeforePause,
          onFinished: onFinished,
          isRepeatingAnimation: isRepeatingAnimation,
          repeatForever: repeatForever,
          totalRepeatCount: totalRepeatCount,
        );

  static List<AnimatedText> _animatedTexts(
    List<String> text,
    TextAlign textAlign,
    TextStyle? textStyle,
    Duration speed,
    Curve curve,
  ) =>
      text
          .map((_) => TyperAnimatedText(
                _,
                textAlign: textAlign,
                textStyle: textStyle,
                speed: speed,
                curve: curve,
              ))
          .toList();
}
