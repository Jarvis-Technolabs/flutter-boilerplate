import 'dart:async';
import 'dart:math';

import 'package:example_app/features/chat_gpt_introduction/constant_chatgpt/chatgpt_constant.dart';
import 'package:flutter/material.dart';

import 'animated_text.dart';

/// Base class for Animated Text widgets.
class AnimatedTextKit extends StatefulWidget {
  final List<AnimatedText> animatedTexts;
  final List<Color> textColors;
  final Duration pause;

  final bool displayFullTextOnTap;
  final bool stopPauseOnTap;
  final VoidCallback? onTap;
  final VoidCallback? onFinished;
  final void Function(int, bool)? onNext;
  final void Function(int, bool)? onNextBeforePause;
  final void Function()? onSetColor;
  final bool isRepeatingAnimation;
  final bool repeatForever;
  final int totalRepeatCount;

  const AnimatedTextKit({
    Key? key,
    required this.animatedTexts,
    required this.textColors,
    this.pause = const Duration(milliseconds: 1000),
    this.displayFullTextOnTap = false,
    this.stopPauseOnTap = false,
    this.onTap,
    this.onNext,
    this.onNextBeforePause,
    this.onSetColor,
    this.onFinished,
    this.isRepeatingAnimation = true,
    this.totalRepeatCount = 3,
    this.repeatForever = false,
  })  : assert(animatedTexts.length > 0, textColors.length > 0),
        assert(!isRepeatingAnimation || totalRepeatCount > 0 || repeatForever),
        assert(null == onFinished || !repeatForever),
        super(key: key);

  @override
  _AnimatedTextKitState createState() => _AnimatedTextKitState();
}

class _AnimatedTextKitState extends State<AnimatedTextKit>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimatedText _currentAnimatedText;
  int _currentRepeatCount = 0;
  int _index = 0;
  int _indexTextColor = 0;
  bool _isCurrentlyPausing = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final completeText = _currentAnimatedText.completeText(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: _isCurrentlyPausing || !_controller.isAnimating
          ? completeText
          : AnimatedBuilder(
              animation: _controller,
              builder: _currentAnimatedText.animatedBuilder,
              child: completeText,
            ),
    );
  }

  bool get _isLast => _index == widget.animatedTexts.length - 1;

  bool get _isLastTextColor => _indexTextColor == widget.textColors.length - 1;

  void _nextAnimation() {
    final isLast = _isLast;
    final isLatsTextColor = _isLastTextColor;

    _isCurrentlyPausing = false;
    if (isLatsTextColor) {
      _indexTextColor = 0;
    } else {
      _indexTextColor++;
    }

    widget.onNext?.call(_index, isLast);

    if (isLast) {
      if (widget.isRepeatingAnimation &&
          (widget.repeatForever ||
              _currentRepeatCount != (widget.totalRepeatCount - 1))) {
        _index = 0;

        if (!widget.repeatForever) {
          _currentRepeatCount++;
        }
      } else {
        widget.onFinished?.call();
        return;
      }
    } else {
      _index++;
    }

    if (mounted) setState(() {});

    _controller.dispose();
    _initAnimation();
  }

  void _initAnimation() {
    _currentAnimatedText = widget.animatedTexts[_index];
    _currentAnimatedText
        .nextTextColorAnimation(widget.textColors[_indexTextColor]);
    _currentAnimatedText.checkAnimationState(AnimationStatus.forward);

    _controller = AnimationController(
      duration: _currentAnimatedText.duration,
      vsync: this,
    );

    _currentAnimatedText.initAnimation(_controller);
    _controller
      ..addStatusListener(_animationEndCallback)
      ..forward();
  }

  void _setPause() {
    final isLast = _isLast;
    _isCurrentlyPausing = true;
    _controller.reverse();
    widget.onNextBeforePause?.call(_index, isLast);
  }

  void _animationEndCallback(AnimationStatus state) {
    if (state == AnimationStatus.completed) {
      _currentAnimatedText.checkAnimationState(state);
      Timer(Duration(milliseconds: 800), () {
        _setPause();
      });
    }
    if (state == AnimationStatus.reverse) {
      _currentAnimatedText.checkAnimationState(state);
      Timer(
          Duration(
              milliseconds:
                  _currentAnimatedText.text.length * (textSpeedTime - 1)), () {
        widget.onSetColor?.call();
      });
      Timer(
          Duration(
              milliseconds:
                  _currentAnimatedText.text.length * (textSpeedTime + 3)), () {
        _controller.stop();
        assert(null == _timer || !_timer!.isActive);
        _timer = Timer(widget.pause, _nextAnimation);
      });
    }
  }

  void _onTap() {
    if (widget.displayFullTextOnTap) {
      if (_isCurrentlyPausing) {
        if (widget.stopPauseOnTap) {
          _timer?.cancel();
          _nextAnimation();
        }
      } else {
        final left =
            (_currentAnimatedText.remaining ?? _currentAnimatedText.duration)
                .inMilliseconds;
        _controller.stop();
        _setPause();
        assert(null == _timer || !_timer!.isActive);
        _timer = Timer(
          Duration(
            milliseconds: max(
              widget.pause.inMilliseconds,
              left,
            ),
          ),
          _nextAnimation,
        );
      }
    }
    widget.onTap?.call();
  }
}
