import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_bloc_widget.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/localizations/app_localizations.dart';
import 'package:flutter_clean_architecture/core/routes/routes.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/button.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/common_app_bar.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/custom_textfield_widget.dart';
import 'package:flutter_clean_architecture/core/util/validation_utilities.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_response_model.dart';
import 'package:flutter_clean_architecture/features/login/login_page.dart';
import 'package:flutter_clean_architecture/features/reset_password/data/model/reset_password_request_model.dart';
import 'package:flutter_clean_architecture/features/reset_password/presentation/bloc/reset_password_event.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localizations/localization_extension.dart';
import '../bloc/reset_password_bloc.dart';
import '../bloc/reset_password_state.dart';

class ResetPasswordScreen extends BaseBlocWidget {
  final ForgotPasswordResponseModel? forgotPasswordResponseModel;

  ResetPasswordScreen({
    Key? key,
    required this.forgotPasswordResponseModel,
  }) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState
    extends BaseBlocWidgetState<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isValidationCheck = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  StreamController<bool> refreshFormStreamController =
      StreamController.broadcast();

  ValidationUtilities validationUtilities = sl();

  @override
  Widget getCustomBloc() => BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
        listener: (_, state) {
          if (state is ResetPasswordSuccessState) {
            navigateAndRemoveAll(
              context: context,
              routeName: Routes.loginPage,
              route: LoginPage(),
            );
          }
        },
        builder: (_, state) => Scaffold(
          backgroundColor: appColors.screenBgColor,
          appBar: CommonAppBar(
            title: LABEL_RESET_PASSWORD,
          ),
          body: resetPasswordBodyWidget(),
        ),
      );

  Widget resetPasswordBodyWidget() => SingleChildScrollView(
        child: StreamBuilder<bool>(
          stream: refreshFormStreamController.stream,
          builder: (_, snapshot) => Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.verticalSpace,
                CustomTextFieldWidget(
                  controller: passwordController,
                  isMandatoryField: true,
                  isObscure: _obscureTextPassword,
                  errorMaxLine: 5,
                  suffixIconWidget: IconButton(
                    icon: Icon(
                      _obscureTextPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      _obscureTextPassword = !_obscureTextPassword;
                      refreshFormStreamController.add(true);
                    },
                  ),
                  hintText: context.tr(LABEL_ENTER_PASSWORD),
                  labelText: context.tr(LABEL_SET_PASSWORD),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onChanged: (String value) {
                    checkValidation();
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
                10.verticalSpace,
                CustomTextFieldWidget(
                  controller: confirmPasswordController,
                  isMandatoryField: true,
                  isObscure: _obscureTextConfirmPassword,
                  errorMaxLine: 5,
                  suffixIconWidget: IconButton(
                    icon: Icon(
                      _obscureTextConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      _obscureTextConfirmPassword =
                          !_obscureTextConfirmPassword;
                      refreshFormStreamController.add(true);
                    },
                  ),
                  hintText: context.tr(LABEL_ENTER_PASSWORD),
                  labelText: context.tr(LABEL_CONFIRM_PASSWORD),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onChanged: (String value) {
                    checkValidation();
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return context.tr(LABEL_EMPTY_PASSWORD);
                    } else if (!validationUtilities.validPassword(value)) {
                      return context.tr(LABEL_VALID_PASSWORD);
                    } else if (passwordController.text != value) {
                      return context.tr(PASSWORD_CONFIRM_NOT_MATCH);
                    } else {
                      return null;
                    }
                  },
                ),
                24.verticalSpace,
                PrimaryButton(
                  title: context.tr(LABEL_SUBMIT),
                  backgroundColor: appColors.primaryColor,
                  buttonTextColor: appColors.whiteColor,
                  selectHandler: () {
                    isValidationCheck = true;
                    bool? value = checkValidation();
                    if (value != null && value) {
                      resetPassword();
                      // navigateWithRemoveUntil(
                      //     context, Routes.loginPage, LoginPage());
                    }
                  },
                  borderColor: appColors.primaryColor,
                ),
              ],
            ).paddingSymmetric(
              screenUtil: screenUtil,
              horizontalPadding: 24.0,
            ),
          ),
        ),
      );

  bool? checkValidation() {
    bool? value = false;
    if (isValidationCheck) {
      value = _formKey.currentState?.validate();
    }
    return value;
  }

  void resetPassword() {
    ResetPasswordRequestModel resetPasswordRequestModel =
        ResetPasswordRequestModel(
      id: widget.forgotPasswordResponseModel?.id,
      password: passwordController.text.trim(),
    );
    BlocProvider.of<ResetPasswordBloc>(context).add(
      ResetPassword(
        request: resetPasswordRequestModel,
      ),
    );
  }
}
