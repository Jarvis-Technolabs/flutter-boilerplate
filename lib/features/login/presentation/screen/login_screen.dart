import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_bloc_widget.dart';
import 'package:flutter_clean_architecture/core/const/app_constants.dart';
import 'package:flutter_clean_architecture/core/const/image_constants.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/localizations/app_localizations.dart';
import 'package:flutter_clean_architecture/core/routes/routes.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_extension/text_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/image_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/button.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/custom_textfield_widget.dart';
import 'package:flutter_clean_architecture/core/util/validation_utilities.dart';
import 'package:flutter_clean_architecture/features/create_an_account/create_an_account_page.dart';
import 'package:flutter_clean_architecture/features/dashboard/dashboard_page.dart';
import 'package:flutter_clean_architecture/features/login/data/model/login_request_model.dart';
import 'package:flutter_clean_architecture/features/login/presentation/bloc/login_event.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_clean_architecture/core/localizations/localization_extension.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';

class LoginScreen extends BaseBlocWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseBlocWidgetState<LoginScreen> {
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isValidationCheck = false;
  bool _obscureText = true;
  StreamController<bool> passwordStreamController =
      StreamController<bool>.broadcast();
  ValidationUtilities validationUtilities = sl();

  @override
  void initState() {
    setLoginDataUsingPreference();
    super.initState();
  }

  void setLoginDataUsingPreference() async {
    String? mobileNo = await preferenceHelper.getMobileNo();
    if (mobileNo != null) {
      mobileNumberController.text = mobileNo;
    }
  }

  @override
  Widget getCustomBloc() => BlocConsumer<LoginBloc, LoginState>(
        listener: (_, state) async {
          if (state is LoginSuccessState) {
            await commonUtilities.trackUserEngagementEvent(
              userId: "132",
              userType: "user",
              eventName: 'login',
              additionalParameters: {
                'source_screen': Routes.loginPage,
                'login_method': 'mobile_password',
              },
            );
            navigateAndRemoveAll(
              context: context,
              routeName: Routes.dashboard,
              route: DashboardPage(),
            );
          }
          if (state is GeneratePublicTokenErrorState) {
            commonUtilities.showToast(
              message: AppLocalizations.of(context).translateOrKey(
                state.message,
              ),
              textColors: appColors.whiteColor,
              backgroundColors: appColors.blackColor,
            );
          }
        },
        builder: (_, state) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Scaffold(
            backgroundColor: appColors.screenBgColor,
            body: loginBodyWidget(),
          ),
        ),
      );

  Widget loginBodyWidget() => SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                12.verticalSpace,
                Center(
                  child: IC_APP_LOGO.getImage(
                    screenUtil: screenUtil,
                    boxFit: BoxFit.fill,
                  ),
                ),
                30.verticalSpace,
                Center(
                  child: context.tr(LABEL_LOG_IN)
                      .getText24W900Text(
                        screenUtil: screenUtil,
                        appColors: appColors,
                      ),
                ),
                30.verticalSpace,
                CustomTextFieldWidget(
                  controller: mobileNumberController,
                  isMandatoryField: true,
                  hintText: context.tr(LABEL_MOBILE_NUMBER),
                  labelText: context.tr(LABEL_MOBILE_NUMBER),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  maxLength: MOBILE_NUMBER_LIMIT,
                  inputFormatterRegex: DIGIT_ONLY_REGEX,
                  onChanged: (String value) {
                    validate();
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return context.tr(LABEL_EMPTY_MOBILE);
                    } else if (value.isNotEmpty &&
                        value.length != MOBILE_NUMBER_LIMIT) {
                      return context.tr(LABEL_VALID_MOBILE);
                    } else {
                      return null;
                    }
                  },
                ),
                10.verticalSpace,
                StreamBuilder<bool>(
                  stream: passwordStreamController.stream,
                  builder: (_, snapshot) => CustomTextFieldWidget(
                    controller: passwordController,
                    isMandatoryField: true,
                    errorMaxLine: 5,
                    isObscure: _obscureText,
                    suffixIconWidget: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        _obscureText = !_obscureText;
                        passwordStreamController.add(true);
                      },
                    ),
                    hintText:
                    context.tr(LABEL_PASSWORD),
                    labelText:
                    context.tr(LABEL_PASSWORD),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    onChanged: (String value) {
                      validate();
                    },
                    onFieldSubmitted: (value) {
                      onSubmit();
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return context.tr(LABEL_EMPTY_PASSWORD);
                      } else if (!validationUtilities.validPassword(value)) {
                        return context.tr(LABEL_VALID_PASSWORD);
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    navigateTo(
                      context,
                      Routes.forgotPasswordPage,
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: context.tr(LABEL_FORGOT_PASSWORD_QUES)
                        .getPrimary14W600Text(
                          screenUtil: screenUtil,
                          appColors: appColors,
                        ),
                  ),
                ),
                24.verticalSpace,
                PrimaryButton(
                  title: context.tr(LABEL_LOG_IN),
                  backgroundColor: appColors.primaryColor,
                  buttonTextColor: appColors.whiteColor,
                  selectHandler: onSubmit,
                  borderColor: appColors.primaryColor,
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    context.tr(LABEL_DO_NOT_HAVE_ACCOUNT)
                        .getSubText14W800Text(
                          screenUtil: screenUtil,
                          appColors: appColors,
                        ),
                    5.horizontalSpace,
                    GestureDetector(
                      onTap: () {
                        navigatePush(
                          context,
                          CreateAnAccountPage(),
                        );
                      },
                      child: context.tr(LABEL_REGISTER_HERE)
                          .getPrimary14W600Text(
                            screenUtil: screenUtil,
                            appColors: appColors,
                          ),
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(
              screenUtil: screenUtil,
              horizontalPadding: 24.0,
            ),
          ),
        ),
      );

  void onSubmit() {
    isValidationCheck = true;
    bool value = validate();
    if (value) {
      LoginRequestModel loginRequestModel = LoginRequestModel(
        mobileNo: mobileNumberController.text.trim(),
        password: passwordController.text.trim(),
      );
      BlocProvider.of<LoginBloc>(context).add(
        LoginRequestEvent(
          request: loginRequestModel,
        ),
      );
    }
  }

  bool validate() {
    bool value = false;
    if (isValidationCheck) {
      value = _formKey.currentState?.validate() ?? false;
    }
    return value;
  }
}
