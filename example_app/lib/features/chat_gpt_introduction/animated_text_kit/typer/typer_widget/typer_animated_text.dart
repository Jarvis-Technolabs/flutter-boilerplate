import 'package:example_app/features/chat_gpt_introduction/animated_text_kit/animated_text_widget/animated_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:vibration/vibration.dart';

class TyperAnimatedText extends AnimatedText {
  final Duration speed;
  final Curve curve;

  TyperAnimatedText(
    String text, {
    TextAlign textAlign = TextAlign.start,
    TextStyle? textStyle,
    this.speed = const Duration(milliseconds: 40),
    this.curve = Curves.linear,
  }) : super(
          text: text,
          textAlign: textAlign,
          textStyle: textStyle,
          duration: speed * text.characters.length,
        );

  late Animation<double> _typingText;
  late Color textColor;
  late AnimationStatus state;

  @override
  Duration get remaining => speed * (textCharacters.length - _typingText.value);

  @override
  void nextTextColorAnimation(Color newTextColor) {
    textColor = newTextColor;
  }

  @override
  void checkAnimationState(AnimationStatus status) {
    state = status;
  }

  @override
  void initAnimation(AnimationController controller) {
    _typingText = CurveTween(
      curve: curve,
    ).animate(controller);
  }

  @override
  Widget animatedBuilder(BuildContext context, Widget? child) {
    final count =
        (_typingText.value.clamp(0, 1) * textCharacters.length).round();
    if (state == AnimationStatus.forward) {
      Future.delayed(const Duration(milliseconds: 12)).then(
        (value) => Vibration.vibrate(pattern: [5, 10, 15, 20, 25, 30]),
      );
    }
    assert(count <= textCharacters.length);
    return textWidget(
        textCharacters.take(count).toString(), TextStyle(color: textColor));
  }
}
