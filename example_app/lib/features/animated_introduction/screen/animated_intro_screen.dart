import 'dart:async';

import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/const/string_constants.dart';
import 'package:example_app/core/localizations/app_localizations.dart';
import 'package:example_app/core/localizations/localization_extension.dart';
import 'package:example_app/features/animated_introduction/text_class/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/const/image_constants.dart';

class AnimatedIntroScreen extends BaseBlocWidget {
  @override
  State<AnimatedIntroScreen> createState() => _AnimatedIntroScreenState();
}

class _AnimatedIntroScreenState
    extends BaseBlocWidgetState<AnimatedIntroScreen> {
  PageController pageController = PageController(viewportFraction: 1.0);
  StreamController<bool> animatedPageState = StreamController<bool>.broadcast();

  var _currPageValue = 0.0;
  dynamic IntroList = [
    {
      "id": 1,
      "image": IC_INTRO_IMG_1,
      "title": "Introduction Title One",
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text."
    },
    {
      "id": 2,
      "image": IC_INTRO_IMG_2,
      "title": "Introduction Title Two",
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text."
    },
    {
      "id": 3,
      "image": IC_INTRO_IMG_3,
      "title": "Introduction Title Three",
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text."
    },
    {
      "id": 4,
      "image": IC_INTRO_IMG_4,
      "title": "Introduction Title Four",
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text."
    },
    {
      "id": 5,
      "image": IC_INTRO_IMG_5,
      "title": "Introduction Title Five",
      "desc":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text."
    }
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      _currPageValue = pageController.page!;
      animatedPageState.add(true);
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  //scale factor
  double _scaleFactor = .3;
  double _height = 500.0;

  @override
  Widget getCustomBloc() {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: appColors.whiteColor,
        title: Text(context.tr(LABEL_ANIMATED_INTRODUCTION)),
      ),
      body: Container(
        padding: EdgeInsets.only(top: screenUtil.setHeight(70)),
        color: Colors.white,
        width: double.maxFinite,
        height: double.maxFinite,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.white,
                height: screenUtil.setHeight(450),
                child: StreamBuilder<bool>(
                    stream: animatedPageState.stream,
                    builder: (context, snapshot) {
                      return PageView.builder(
                        controller: pageController,
                        physics: BouncingScrollPhysics(),
                        itemCount: IntroList.length,
                        itemBuilder: (context, position) {
                          return _buildPageItem(position);
                        },
                      );
                    }),
              ),
              SmoothPageIndicator(
                controller: pageController,
                count: IntroList.length,
                effect: WormEffect(
                  dotHeight: screenUtil.setHeight(12.0),
                  dotWidth: screenUtil.setWidth(12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();

    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = screenUtil.setHeight(_height) * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = screenUtil.setHeight(_height) * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = screenUtil.setHeight(_height) * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1.0, currScale, 1.0)
        ..setTranslationRaw(
            0, screenUtil.setHeight(_height) * (1 - _scaleFactor) / 2, 0);
    }
    return Column(
      children: [
        Transform(
          transform: matrix,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenUtil.setWidth(50)),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.only(
                    left: screenUtil.setWidth(20),
                    top: screenUtil.setWidth(20)),
                height: screenUtil.setHeight(280),
                width:
                    MediaQuery.of(context).size.width - screenUtil.setWidth(10),
                margin: EdgeInsets.only(
                    right: screenUtil.setWidth(5),
                    left: screenUtil.setWidth(5)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    //  color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(IntroList[index]["image"]))),
                // child: Image.network(IntroList[index]),
              ),
            ),
          ),
        ),
        SizedBox(height: screenUtil.setHeight(35)),
        HeadingTextWidget(
          text: IntroList[index]["title"],
          color: Color(0xFF364BA8),
          size: 20,
        ),
        SizedBox(height: screenUtil.setHeight(12)),
        Padding(
          padding: EdgeInsets.only(
              left: screenUtil.setWidth(20), right: screenUtil.setWidth(20)),
          child: DescTextWidget(
            text: IntroList[index]["desc"],
            color: Color(0xFF969696),
            size: 14,
          ),
        ),
      ],
    );
  }
}
