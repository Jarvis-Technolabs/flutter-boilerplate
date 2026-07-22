import 'dart:async';

import 'package:example_app/core/const/image_constants.dart';
import 'package:example_app/core/ui/accessibilityextension/AccessibilityWidget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/image_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/core/ui/widgets/button.dart';
import 'package:example_app/core/ui/widgets/custom_cupertino_switch_widget.dart';
import 'package:example_app/core/ui/widgets/custom_textfield_widget.dart';
import 'package:example_app/core/ui/widgets/radio_button_with_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base/screen/base_bloc_widget.dart';
import '../../../../core/const/string_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/localizations/localization_extension.dart';
import '../bloc/accessibility_bloc.dart';
import '../bloc/accessibility_state.dart';

class AccessibilityScreen extends BaseBlocWidget {
  AccessibilityScreen({Key? key}) : super(key: key);

  @override
  State<AccessibilityScreen> createState() => _AccessibilityScreenState();
}

class _AccessibilityScreenState
    extends BaseBlocWidgetState<AccessibilityScreen> {
// StreamControllers for state changes that need UI refresh
  final StreamController<bool> _switchStreamController =
      StreamController<bool>.broadcast();
  final StreamController<String?> _genderStreamController =
      StreamController<String?>.broadcast();

  bool isRememberMe = false;
  String? genderGroupValue;

  List<String> favouriteWorkoutList = [
    "Cardio",
    "Strength Training",
  ];

  @override
  void didChangeDependencies() {
    favouriteWorkoutList = [
      context.tr(LABEL_WORKOUT_TYPE_1),
      context.tr(LABEL_WORKOUT_TYPE_2),
    ];
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _switchStreamController.close();
    _genderStreamController.close();
    super.dispose();
  }

  @override
  Widget getCustomBloc() {
    return BlocConsumer<AccessibilityBloc, AccessibilityState>(
      listener: (_, state) {},
      builder: (_, state) {
        return Scaffold(
          backgroundColor: appColors.screenBgColor,
          appBar: AppBar(
            title: context.tr(LABEL_ACCESSIBILITY)
                .getWhiteColor17W500Inter(
                  screenUtil: screenUtil,
                  appColors: appColors,
                )
                .setSemanticsLabelWithChild(
                  label: context.tr(LABEL_SEM_ACCESSIBILITY_DEMO_SCREEN),
                ),
          ),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
// 1. setSemanticsImage
                  Center(
                          child: IC_INTRO_IMG_1.getImage(
                              screenUtil: screenUtil, height: 100, width: 100))
                      .setSemanticsImage(
                        label: context.tr(LABEL_SEM_USER_PROFILE_AVATAR),
                      )
                      .paddingOnly(screenUtil,
                          paddingTop: 30, paddingBottom: 40),

// 2. setSemanticsMerge
                  Row(
                    children: [
                      context.tr(LABEL_CURRENT_BALANCE)
                          .getTextColor17W500Inter(
                            screenUtil: screenUtil,
                            appColors: appColors,
                          ),
                      SizedBox(width: screenUtil.setWidth(10)),
                      context.tr(LABEL_BALANCE_AMOUNT)
                          .getBlackColor17W500Inter(
                            screenUtil: screenUtil,
                            appColors: appColors,
                          ),
                    ],
                  )
                      .setSemanticsMerge()
                      .paddingOnly(screenUtil, paddingBottom: 40),

// 3. setTextFieldSemantics
                  CustomTextFieldWidget(
                    labelText: context.tr(LABEL_EMAIL_ADDRESS),
                    hintText: context.tr(LABEL_EMAIL_ADDRESS),
                    isMandatoryField: true,
                    textInputAction: TextInputAction.next,
                  )
                      .setTextFieldSemantics(
                        label: context.tr(LABEL_SEM_ENTER_EMAIL),
                      )
                      .paddingOnly(screenUtil, paddingBottom: 40),

// 4. setSemanticsSwitchButton – with StreamBuilder for dynamic label
                  StreamBuilder<bool>(
                    stream: _switchStreamController.stream,
                    initialData: isRememberMe,
                    builder: (context, snapshot) {
                      bool currentValue = snapshot.data ?? false;
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          context.tr(LABEL_REMEMBER_ME)
                              .getTextColor17W500Inter(
                                screenUtil: screenUtil,
                                appColors: appColors,
                              ),
                          CustomCupertinoSwitchWidget(
                            transformScale: 0.7,
                            onSwitchValueChange: (value) {
                              isRememberMe = value;
                              _switchStreamController.add(value);
                            },
                            activeColor: appColors.primaryColor,
                            trackColor: appColors.secondaryColor,
                            switchValue: currentValue,
                          ),
                        ],
                      )
                          .setSemanticsSwitchButton(
                            label: currentValue
                                ? context.tr(LABEL_SEM_REMEMBER_ME_ENABLED)
                                : context.tr(LABEL_SEM_REMEMBER_ME_DISABLED),
                          )
                          .paddingOnly(screenUtil, paddingBottom: 40);
                    },
                  ),

// 5. setSemanticsButton
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: screenUtil.setHeight(50),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: appColors.primaryColor,
                        borderRadius:
                            BorderRadius.circular(screenUtil.setWidth(8)),
                      ),
                      child: context.tr(LABEL_LOG_IN)
                          .getWhiteColor17W500Inter(
                            screenUtil: screenUtil,
                            appColors: appColors,
                          ),
                    ),
                  )
                      .setSemanticsButton(
                        label: context.tr(LABEL_SEM_LOGIN_BUTTON),
                      )
                      .paddingOnly(screenUtil, paddingBottom: 40),

// 6. setSemanticsButtonWithChild
                  PrimaryButton(
                    title:
                        context.tr(LABEL_SIGN_UP),
                    backgroundColor: appColors.primaryColor,
                    buttonTextColor: appColors.whiteColor,
                    selectHandler: () {},
                  )
                      .setSemanticsButtonWithChild(
                        hint: context.tr(LABEL_SEM_SIGN_UP_HINT),
                      )
                      .paddingOnly(screenUtil, paddingBottom: 40),

// 7. setSemanticsLabel
                  context.tr(LABEL_SUBMIT)
                      .getBlackColor17W500Inter(
                        screenUtil: screenUtil,
                        appColors: appColors,
                      )
                      .setSemanticsLabel(
                        label: context.tr(LABEL_SEM_SUBMIT_BUTTON),
                      )
                      .paddingOnly(screenUtil, paddingBottom: 20),

// 8. setDisableSemantics
                  Center(
                    child: Icon(
                      Icons.accessibility,
                      size: screenUtil.setSp(60),
                      color: appColors.dividerColor,
                    ),
                  )
                      .setDisableSemantics()
                      .paddingOnly(screenUtil, paddingBottom: 20),

// 9. setSemantics – Gender group with StreamBuilder
                  StreamBuilder<String?>(
                    stream: _genderStreamController.stream,
                    initialData: genderGroupValue,
                    builder: (context, snapshot) {
                      String? currentGender = snapshot.data;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          context.tr(LABEL_GENDER)
                              .getTextColor17W500Inter(
                                screenUtil: screenUtil,
                                appColors: appColors,
                              )
                              .paddingOnly(screenUtil, paddingBottom: 10),
                          Row(
                            children: [
                              RadioButtonWithLabelWidget(
                                groupValue: currentGender,
                                title: context.tr(LABEL_MALE),
                                selectedValue: (dynamic value) {
                                  genderGroupValue = value.toString();
                                  _genderStreamController.add(genderGroupValue);
                                  AccessibilityMessages.announce(
                                      context.tr(LABEL_SEM_MALE_SELECTED));
                                },
                              ).paddingOnly(screenUtil, paddingRight: 30),
                              RadioButtonWithLabelWidget(
                                groupValue: currentGender,
                                title: context.tr(LABEL_FEMALE),
                                selectedValue: (dynamic value) {
                                  genderGroupValue = value.toString();
                                  _genderStreamController.add(genderGroupValue);
                                  AccessibilityMessages.announce(
                                      context.tr(
                                          LABEL_SEM_FEMALE_SELECTED));
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                          .setSemantics(container: true)
                          .paddingOnly(screenUtil, paddingBottom: 40);
                    },
                  ),
                ],
              ).paddingAll(padding: 20, screenUtil: screenUtil),
            ),
          ),
        );
      },
    );
  }
}
