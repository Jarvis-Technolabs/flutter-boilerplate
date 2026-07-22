import 'package:example_app/core/app_configuration_bloc/app_configuration_bloc.dart';
import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_configuration_bloc/app_configuration_event.dart';
import '../../../../core/const/string_constants.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/localizations/localization_extension.dart';
import '../../../../core/preference/preference_helper.dart';
import '../../data/model/language_model.dart';

class ChangeLanguageScreen extends BaseBlocWidget {
  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState
    extends BaseBlocWidgetState<ChangeLanguageScreen> {
  late List<LanguageModel> languageList;
  PreferenceHelper preferenceHelper = sl();

  @override
  void didChangeDependencies() {
    /// List of language
    languageList = [
      LanguageModel(
          title: context.tr(LABEL_ENGLISH),
          languageCode: "en"),
      LanguageModel(
          title: context.tr(LABEL_SPANISH),
          languageCode: "es")
    ];
    super.didChangeDependencies();
  }

  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_CHANGE_LANGUAGE)
              .getWhiteColor17W500Inter(
                  screenUtil: screenUtil, appColors: appColors),
        ),
        body: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: languageList.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {
                  /// call AppConfigurationBloc's LanguageChangeEvent event
                  BlocProvider.of<AppConfigurationBloc>(context).add(
                      LanguageChangeEvent(
                          languageCode: languageList[index].languageCode));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        languageList[index].title.getTextColor17W500Inter(
                            screenUtil: screenUtil, appColors: appColors),
                        preferenceHelper.getLanguage() ==
                                languageList[index].languageCode
                            ? Icon(
                                Icons.radio_button_checked,
                                size: screenUtil.setHeight(18),
                              )
                            : Icon(
                                Icons.radio_button_off,
                                size: screenUtil.setHeight(18),
                              )
                      ],
                    ).paddingSymmetric(
                        horizontalPadding: 20,
                        verticalPadding: 20,
                        screenUtil: screenUtil),
                    Divider(
                      color: appColors.dividerColor,
                      thickness: screenUtil.setHeight(1),
                      height: screenUtil.setHeight(1),
                    )
                  ],
                ),
              );
            }),
      );
}
