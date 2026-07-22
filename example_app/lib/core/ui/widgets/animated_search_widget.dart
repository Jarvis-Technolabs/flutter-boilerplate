import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:flutter/material.dart';

// Please update the value of this ANIMATION_PAUSE_DURATION according to your requirements.
enum SearchBoxAnimationType { faded, typed, wavy, flicker, rotate }

// Please update the value of this ANIMATION_PAUSE_DURATION according to your requirements.
const int ANIMATION_PAUSE_DURATION = 2;

class AnimatedCustomSearchWidget extends BaseScreen {
  final List<String>? hintList;
  final String? hintText;
  final Function(String text) onSubmitted;
  final SearchBoxAnimationType animationType;

  AnimatedCustomSearchWidget({
    this.hintList,
    this.hintText,
    required this.onSubmitted,
    this.animationType = SearchBoxAnimationType.faded,
  });

  @override
  _CustomSearchWidgetState createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState
    extends BaseScreenState<AnimatedCustomSearchWidget> {
  int _hintIndex = 0;
  late TextEditingController _controller;
  StreamController<bool> refreshSteamController =
      StreamController<bool>.broadcast();
  bool _showTextField = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    if (widget.hintList != null &&
        widget.hintList!.isNotEmpty &&
        widget.hintText == null) {
      _startAutoHintChange();
    } else {
      _showTextField = true;
    }
  }

  void _startAutoHintChange() {
    Timer.periodic(Duration(seconds: ANIMATION_PAUSE_DURATION), (timer) {
      _hintIndex = (_hintIndex + 1) % widget.hintList!.length;
      refreshSteamController.add(true);
    });
  }

  Widget _buildAnimatedHintWidget(String hint) {
    switch (widget.animationType) {
      case SearchBoxAnimationType.faded:
        return AnimatedTextKit(
          animatedTexts: [FadeAnimatedText(hint)],
          repeatForever: true,
          pause: Duration(seconds: ANIMATION_PAUSE_DURATION),
          displayFullTextOnTap: true,
        );
      case SearchBoxAnimationType.rotate:
        return AnimatedTextKit(
          animatedTexts: [RotateAnimatedText(hint)],
          repeatForever: true,
          pause: Duration(seconds: ANIMATION_PAUSE_DURATION),
          displayFullTextOnTap: true,
        );
      case SearchBoxAnimationType.typed:
        return AnimatedTextKit(
          animatedTexts: [TyperAnimatedText(hint)],
          repeatForever: true,
          pause: Duration(seconds: ANIMATION_PAUSE_DURATION),
          displayFullTextOnTap: true,
        );
      case SearchBoxAnimationType.wavy:
        return AnimatedTextKit(
          animatedTexts: [WavyAnimatedText(hint)],
          repeatForever: true,
          pause: Duration(seconds: ANIMATION_PAUSE_DURATION),
          displayFullTextOnTap: true,
        );
      case SearchBoxAnimationType.flicker:
        return AnimatedTextKit(
          animatedTexts: [FlickerAnimatedText(hint)],
          repeatForever: true,
          pause: Duration(seconds: ANIMATION_PAUSE_DURATION),
          displayFullTextOnTap: true,
        );
    }
  }

  @override
  Widget body(BuildContext context) {
    return StreamBuilder<bool>(
        stream: refreshSteamController.stream,
        builder: (context, snapshot) {
          return Container(
            height: screenUtil.setHeight(55),
            padding: EdgeInsets.symmetric(
              horizontal: screenUtil.setWidth(12),
            ),
            decoration: BoxDecoration(
              color: appColors.whiteColor,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: appColors.grayColor,
                width: screenUtil.setWidth(1.5),
              ),
            ),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if (widget.hintText == null) {
                  _showTextField = true;
                  refreshSteamController.add(true);
                }
              },
              child: Row(
                children: [
                  Icon(Icons.search_outlined),
                  SizedBox(
                    width: screenUtil.setHeight(8),
                  ),
                  _buildAnimatedHintOrTextField(),
                ],
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimatedHintOrTextField() {
    if (_showTextField) {
      return _buildTextField();
    } else {
      return AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: DefaultTextStyle(
            softWrap: true,
            style: getFormHintTextStyle(
                screenUtil: screenUtil, appColors: appColors),
            child: _buildAnimatedHintWidget(widget.hintList![_hintIndex])),
        key: ValueKey<String>(widget.hintList![_hintIndex]),
      );
    }
  }

  Widget _buildTextField() {
    return Expanded(
      child: TextField(
        autofocus: true,
        controller: _controller,
        onSubmitted: (text) {
          _handleSearch(text);
        },
        decoration: InputDecoration(
          hintText: widget.hintText ?? widget.hintList![_hintIndex],
          border: InputBorder.none,
        ),
      ),
    );
  }

  void _handleSearch(String searchText) {
    widget.onSubmitted(searchText);
    refreshSteamController.add(true);
  }
}
