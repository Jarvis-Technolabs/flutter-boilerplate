import 'dart:async';

import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/const/string_constants.dart';
import 'package:example_app/core/localizations/app_localizations.dart';
import 'package:example_app/features/chat_gpt_introduction/model/text_animated_model.dart';
import 'package:flutter/material.dart';

import '../../../core/localizations/localization_extension.dart';
import '../animated_text_kit/animated_text_widget/animated_text_kit_widget.dart';
import '../animated_text_kit/typer/typer_widget/typer_animated_text.dart';
import '../constant_chatgpt/chatgpt_constant.dart';

class ChatGPTIntroScreen extends BaseBlocWidget {
  @override
  State<ChatGPTIntroScreen> createState() => _ChatGPTIntroScreenState();
}

class _ChatGPTIntroScreenState extends BaseBlocWidgetState<ChatGPTIntroScreen>
    with SingleTickerProviderStateMixin {
  late List<TextAnimated> _animatedText;
  int _index = 0;
  int currentBackgroundColorIndex = 0;
  int nextBackgroundColorIndex = 1;

  int textCurrentColorIndex = 0;
  int textNextColorIndex = 1;

  StreamController<bool> animatedController = StreamController.broadcast();

  late AnimationController _animationColorController;
  late Animation _colorTween;

  var arrTyperAnimatedText = [
    TyperAnimatedText(
      'First Text',
      speed: textSpeedDuration,
      textAlign: TextAlign.center,
    ),
    TyperAnimatedText(
      'Second Text',
      speed: textSpeedDuration,
      textAlign: TextAlign.center,
    ),
    TyperAnimatedText(
      'Third Text',
      speed: textSpeedDuration,
      textAlign: TextAlign.center,
    ),
    TyperAnimatedText(
      'Fourth Text',
      speed: textSpeedDuration,
      textAlign: TextAlign.center,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animatedText = listAnimatedText(onTap: () {});
    _animationColorController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animateBackgroundColor(
        beginColor: backgroundColors[currentBackgroundColorIndex],
        endColor: backgroundColors[nextBackgroundColorIndex]);
  }

  void animateBackgroundColor({
    required Color beginColor,
    required Color endColor,
  }) {
    _colorTween = ColorTween(begin: beginColor, end: endColor)
        .animate(_animationColorController);
    _animationColorController.forward();
  }

  @override
  Widget getCustomBloc() {
    final animatedText = _animatedText[_index];
    return Scaffold(
      appBar: AppBar(
        foregroundColor: appColors.whiteColor,
        title: Text(context.tr(LABEL_CHAT_GPT_INTRODUCTION)),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: StreamBuilder<bool>(
                stream: animatedController.stream,
                builder: (context, snapshot) {
                  return AnimatedContainer(
                    decoration: BoxDecoration(color: _colorTween.value),
                    duration: backgroundColorChangeDuration,
                    child: Center(
                      key: ValueKey(animatedText.label),
                      child: animatedText.child,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }

  List<TextAnimated> listAnimatedText({VoidCallback? onTap}) => <TextAnimated>[
        TextAnimated(
          label: '',
          color: Colors.transparent,
          child: DefaultTextStyle(
            style: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Bobbers',
                fontWeight: FontWeight.w500),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 0,
                ),
                AnimatedTextKit(
                  animatedTexts: arrTyperAnimatedText,
                  onTap: onTap,
                  pause: textPauseDuration,
                  repeatForever: true,
                  onSetColor: () {
                    textCurrentColorIndex++;
                    textNextColorIndex++;
                    currentBackgroundColorIndex++;
                    nextBackgroundColorIndex++;
                    int lastIndexColor = textColors.length - 1;
                    if (textCurrentColorIndex > lastIndexColor) {
                      textCurrentColorIndex = 0;
                    }

                    if (nextBackgroundColorIndex >
                        backgroundColors.length - 1) {
                      nextBackgroundColorIndex = 0;
                    }
                    if (currentBackgroundColorIndex >
                        backgroundColors.length - 1) {
                      currentBackgroundColorIndex = 0;
                    }
                    animateBackgroundColor(
                        beginColor:
                            backgroundColors[currentBackgroundColorIndex],
                        endColor: backgroundColors[nextBackgroundColorIndex]);
                    animatedController.add(true);
                  },
                  textColors: textColors,
                ),
                SizedBox(
                  width: 2,
                ),
                StreamBuilder<bool>(
                    stream: animatedController.stream,
                    builder: (context, snapshot) {
                      return Container(
                        width: screenUtil.setWidth(35),
                        height: screenUtil.setHeight(35),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: textColors[textCurrentColorIndex]),
                      );
                    })
              ],
            ),
          ),
        ),
      ];
}
