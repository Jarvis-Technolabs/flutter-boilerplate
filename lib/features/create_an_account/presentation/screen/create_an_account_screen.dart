import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_bloc_widget.dart';
import 'package:flutter_clean_architecture/core/const/app_constants.dart';
import 'package:flutter_clean_architecture/core/const/string_constants.dart';
import 'package:flutter_clean_architecture/core/di/injection_container.dart';
import 'package:flutter_clean_architecture/core/enums/otp_screen_type.dart';
import 'package:flutter_clean_architecture/core/enums/otp_verification_for.dart';
import 'package:flutter_clean_architecture/core/localizations/app_localizations.dart';
import 'package:flutter_clean_architecture/core/routes/routes.dart';
import 'package:flutter_clean_architecture/core/ui/theme/text_extension/text_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/button.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/common_app_bar.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/custom_textfield_widget.dart';
import 'package:flutter_clean_architecture/core/util/validation_utilities.dart';
import 'package:flutter_clean_architecture/features/create_an_account/data/model/signup_request_model.dart';
import 'package:flutter_clean_architecture/features/create_an_account/presentation/bloc/create_an_account_bloc.dart';
import 'package:flutter_clean_architecture/features/create_an_account/presentation/bloc/create_an_account_event.dart';
import 'package:flutter_clean_architecture/features/create_an_account/presentation/bloc/create_an_account_state.dart';
import 'package:flutter_clean_architecture/features/otp_verification/otp_verification_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localizations/localization_extension.dart';

class CreateAnAccountScreen extends BaseBlocWidget {
  CreateAnAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CreateAnAccountScreen> createState() => _CreateAnAccountScreenState();
}

class _CreateAnAccountScreenState
    extends BaseBlocWidgetState<CreateAnAccountScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isValidationCheck = false;
  bool _obscureTextPassword = true;
  bool _obscureTextConfirmPassword = true;

  StreamController<bool> passwordObscureStreamController =
      StreamController.broadcast();
  ValidationUtilities validationUtilities = sl();

  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: CommonAppBar(
          title: LABEL_REGISTER,
        ),
        body: BlocListener<CreateAnAccountBloc, CreateAnAccountState>(
          listener: (_, state) {
            if (state is SignupState) {
              navigatePush(
                context,
                OtpVerificationPage(
                  email: emailController.text.trim(),
                  mobileNumber: mobileNumberController.text.trim(),
                  sendOtpTo: mobileNumberController.text.trim().isNotEmpty
                      ? SendOtpTo.Mobile
                      : SendOtpTo.Email,
                  sendOtpFor: SendOtpFor.REGISTER,
                ),
              );
            }
          },
          child: createAnAccountBodyWidget(),
        ),
      );

  Widget createAnAccountBodyWidget() => SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              CustomTextFieldWidget(
                controller: fullNameController,
                isMandatoryField: true,
                hintText: context.tr(LABEL_ENTER_FULL_NAME),
                labelText: context.tr(LABEL_NAME),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: (String value) {
                  checkValidation();
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(LABEL_EMPTY_FULL_NAME);
                  } else if (value.isNotEmpty && value.length < 3) {
                    return context.tr(LABEL_VALID_FULL_NAME);
                  } else {
                    return null;
                  }
                },
              ),
              10.verticalSpace,
              CustomTextFieldWidget(
                controller: emailController,
                isMandatoryField: true,
                hintText:
                context.tr(LABEL_ENTER_EMAIL),
                labelText: context.tr(LABEL_EMAIL),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onChanged: (String value) {
                  checkValidation();
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(EMPTY_EMAIL_ADDRESS);
                  } else if (!validationUtilities.isEmail(value)) {
                    return context.tr(VALID_EMAIL_ADDRESS);
                  } else {
                    return null;
                  }
                },
              ),
              10.verticalSpace,
              CustomTextFieldWidget(
                controller: mobileNumberController,
                isMandatoryField: true,
                hintText:
                    context.tr(LABEL_MOBILE_NUMBER),
                labelText:
                context.tr(LABEL_MOBILE_NUMBER),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                maxLength: MOBILE_NUMBER_LIMIT,
                onChanged: (String value) {
                  checkValidation();
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(LABEL_EMPTY_MOBILE);
                  } else if (value.isNotEmpty &&
                      value.length < MOBILE_NUMBER_LIMIT) {
                    return context.tr(LABEL_VALID_MOBILE);
                  } else {
                    return null;
                  }
                },
              ),
              10.verticalSpace,
              StreamBuilder<bool>(
                stream: passwordObscureStreamController.stream,
                builder: (_, snapshot) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          passwordObscureStreamController.add(true);
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
                          passwordObscureStreamController.add(true);
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
                  ],
                ),
              ),
              24.verticalSpace,
              PrimaryButton(
                title: context.tr(LABEL_REGISTER),
                backgroundColor: appColors.primaryColor,
                buttonTextColor: appColors.whiteColor,
                borderColor: appColors.primaryColor,
                selectHandler: () {
                  isValidationCheck = true;
                  if (checkValidation()) {
                    BlocProvider.of<CreateAnAccountBloc>(context).add(
                      SignupEvent(
                        request: SignupRequestModel(
                          name: fullNameController.text.trim(),
                          email: emailController.text.trim(),
                          mobileNo: mobileNumberController.text.trim(),
                          password: passwordController.text.trim(),
                        ),
                      ),
                    );
                  }
                },
              ),
              24.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  context.tr(LABEL_ALREADY_HAVE_AN_ACCOUNT)
                      .getSubText14W800Text(
                        screenUtil: screenUtil,
                        appColors: appColors,
                      ),
                  5.horizontalSpace,
                  GestureDetector(
                    onTap: () {
                      goBack(context);
                    },
                    child: context.tr(LABEL_LOG_IN)
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
      );

  bool checkValidation() {
    bool value = false;
    if (isValidationCheck && _formKey.currentState != null) {
      value = _formKey.currentState!.validate();
    }
    return value;
  }
}
