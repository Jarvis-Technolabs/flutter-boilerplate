import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/firebase_notification_data_source/firebase_notification_data_source.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/features/splash/presentation/bloc/splash_event.dart';
import 'package:example_app/features/splash/presentation/bloc/splash_state.dart';
import 'package:chucker_flutter/src/view/helper/chucker_ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/const/string_constants.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/localizations/localization_extension.dart';
import '../../../../core/routes/routes.dart';
import '../../../splash/presentation/bloc/splash_bloc.dart';

class ExampleScreen extends BaseBlocWidget {
  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends BaseBlocWidgetState<ExampleScreen> {
  late List<String> exampleList;
  late String screenTitle;

  @override
  void initState() {
    /// TODO - Uncomment below code to call force update
    // forceUpdateAPICall();
    initNotification();
    exampleList = [
      LABEL_SIGN_UP_BASIC_FORM,
      LABEL_GET_API_IMPLEMENTATION,
      LABEL_CHANGE_APP_THEME,
      LABEL_CHANGE_LANGUAGE,
      LABEL_IMAGE_AND_FILE_PICKER,
      LABEL_LOTTIE_IMAGE,
      LABEL_LOCAL_DATABASE_CRUD,
      LABEL_WEB_VIEW_IMPL,
      LABEL_SHARE_EXAMPLE,
      LABEL_BOTTOM_NAVIGATION_BAR_EXAMPLE,
      LABEL_SOCIAL_LOGIN,
      LABEL_FIREBASE_PHONE_AUTHENTICATION,
      LABEL_DOWNLOAD_FILE_EXAMPLE,
      LABEL_OVERLAY_WIDGET,
      LABEL_GOOGLE_MAP_EXAMPLE,
      LABEL_ANIMATED_SEARCH_BAR,
      LABEL_CUSTOM_PROGRESS_INDICATOR,
      LABEL_TOUCH_FACE_AUTH,
      LABEL_EMAIL_MOBILE_TEXTVIEW,
      LABEL_PAGINATION_WITH_DELETE,
      LABEL_CUSTOM_LOADER,
      LABEL_SENSITIVE_INFO_BLUR_BACKGROUND,
      LABEL_ANIMATED_INTRODUCTION,
      LABEL_CHAT_GPT_INTRODUCTION,
      LABEL_ACCESSIBILITY,
      LABEL_CHUCKER,
    ];
    super.initState();
  }

  void forceUpdateAPICall() async {
    BlocProvider.of<SplashBloc>(context).add(
      FetchGetMobileConfigEventDataEvent(),
    );
  }

  void initNotification() {
    FirebaseNotificationDataSource appDataSource = sl();
    WidgetsBinding.instance.addPostFrameCallback(
          (_) {
        appDataSource.initializeNotifications(
          onLaunch: () {},
          onLaunchWithoutNotification: () {},
        );
      },
    );
  }

  @override
  Widget getCustomBloc() =>
      Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_EXAMPLE)
              .getWhiteColor17W500Inter(
              screenUtil: screenUtil, appColors: appColors),
        ),
        body: BlocConsumer<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is GetMobileConfigFetchedState) {
              if(!state.isAllowed){
                commonUtilities.showAppUpdateDialog(context: context,screenUtil: screenUtil,appColors: appColors);
              }
            }
          },
          builder: (context, state) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: exampleList.length,
              itemBuilder: (_, index) =>
                  InkWell(
                    onTap: () {
                      onTileTap(index);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: context.tr(exampleList[index])
                                  .getTextColor17W500Inter(
                                screenUtil: screenUtil,
                                appColors: appColors,
                                maxLine: 3,
                              )
                                  .paddingOnly(
                                screenUtil,
                                paddingRight: 20,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: appColors.textColor,
                              size: screenUtil.setHeight(18),
                            )
                          ],
                        ).paddingSymmetric(
                          horizontalPadding: 20,
                          verticalPadding: 20,
                          screenUtil: screenUtil,
                        ),
                        Divider(
                          color: appColors.dividerColor,
                          thickness: screenUtil.setHeight(1),
                          height: screenUtil.setHeight(1),
                        )
                      ],
                    ),
                  ),
            );
          },
        ),
      );

  void onTileTap(int index) {
    screenTitle = exampleList[index];
    switch (screenTitle) {
      case LABEL_SIGN_UP_BASIC_FORM:
        navigateTo(context, Routes.signUpBasicFormPage);
        break;
      case LABEL_GET_API_IMPLEMENTATION:
        navigateTo(context, Routes.getApiPage);
        break;
      case LABEL_CHANGE_APP_THEME:
        navigateTo(context, Routes.changeAppThemePage);
        break;
      case LABEL_CHANGE_LANGUAGE:
        navigateTo(context, Routes.changeLanguagePage);
        break;
      case LABEL_LOTTIE_IMAGE:
        navigateTo(context, Routes.lottieImageExampleScreen);
        break;
      case LABEL_LOCAL_DATABASE_CRUD:
        navigateTo(context, Routes.localDatabaseExamplePage);
        break;
      case LABEL_WEB_VIEW_IMPL:
        navigateTo(context, Routes.webViewPage);
        break;
      case LABEL_SHARE_EXAMPLE:
        navigateTo(context, Routes.shareExampleScreen);
        break;
      case LABEL_BOTTOM_NAVIGATION_BAR_EXAMPLE:
        navigateTo(context, Routes.bottomNavigationBarExamplePage);
        break;
      case LABEL_SOCIAL_LOGIN:
        navigateTo(context, Routes.socialLoginPage);
        break;
      case LABEL_FIREBASE_PHONE_AUTHENTICATION:
        navigateTo(context, Routes.firebasePhoneAuthPage);
        break;
      case LABEL_IMAGE_AND_FILE_PICKER:
        navigateTo(context, Routes.imageAndFilePickerPage);
        break;
      case LABEL_DOWNLOAD_FILE_EXAMPLE:
        navigateTo(context, Routes.fileDownloadExamplePage);
        break;
      case LABEL_OVERLAY_WIDGET:
        navigateTo(context, Routes.overlayWidgetExampleScreen);
        break;
      case LABEL_GOOGLE_MAP_EXAMPLE:
        navigateTo(context, Routes.googleMapExampleScreen);
        break;
      case LABEL_ANIMATED_SEARCH_BAR:
        navigateTo(context, Routes.animatedSearchBar);
        break;
      case LABEL_CUSTOM_PROGRESS_INDICATOR:
        navigateTo(context, Routes.customProgressIndicator);
        break;
      case LABEL_EMAIL_MOBILE_TEXTVIEW:
        navigateTo(context, Routes.customEmailMobileTextView);
        break;
      case LABEL_TOUCH_FACE_AUTH:
        navigateTo(context, Routes.touchAndFaceIdAuthScreen);
        break;
      case LABEL_CUSTOM_LOADER:
        navigateTo(context, Routes.customLoader);
        break;
      case LABEL_SENSITIVE_INFO_BLUR_BACKGROUND:
        navigateTo(context, Routes.sensitiveInfo);
        break;
      case LABEL_PAGINATION_WITH_DELETE:
        navigateTo(context, Routes.paginationWithDelete);
        break;
      case LABEL_ANIMATED_INTRODUCTION:
        navigateTo(context, Routes.animatedIntro);
        break;

      case LABEL_CHAT_GPT_INTRODUCTION:
        navigateTo(context, Routes.chatGPTIntro);
        break;

      case LABEL_ACCESSIBILITY:
        navigateTo(context, Routes.accessibility);
        break;
      case LABEL_CHUCKER:
        ChuckerUiHelper.showChuckerScreen();
        break;
    }
  }
}
