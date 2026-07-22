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
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/button.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/common_app_bar.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/custom_textfield_widget.dart';
import 'package:flutter_clean_architecture/core/util/validation_utilities.dart';
import 'package:flutter_clean_architecture/features/forgot_password/data/model/forgotPassword_request_model.dart';
import 'package:flutter_clean_architecture/features/forgot_password/presentation/bloc/forgot_password_event.dart';
import 'package:flutter_clean_architecture/features/otp_verification/otp_verification_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localizations/localization_extension.dart';
import '../bloc/forgot_password_bloc.dart';
import '../bloc/forgot_password_state.dart';

class ForgotPasswordScreen extends BaseBlocWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends BaseBlocWidgetState<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController mobileEmailController = TextEditingController();
  bool isValidationCheck = false;
  ValidationUtilities validationUtilities = sl();

  @override
  Widget getCustomBloc() => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: CommonAppBar(
          title: LABEL_FORGOT_PASSWORD,
        ),
        body: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
          listener: (_, state) {
            if (state is ForgotPassword) {
              navigatePush(
                context,
                OtpVerificationPage(
                  sendOtpTo: validationUtilities
                          .isOnlyDigits(mobileEmailController.text.trim())
                      ? SendOtpTo.Mobile
                      : SendOtpTo.Email,
                  email: mobileEmailController.text.trim(),
                  mobileNumber: mobileEmailController.text.trim(),
                  sendOtpFor: SendOtpFor.FORGOT_PASSWORD,
                  forgotPasswordResponseModel: state.response,
                ),
              );
            }
          },
          child: forgotPasswordBodyWidget(),
        ),
      );

  Widget forgotPasswordBodyWidget() => SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              CustomTextFieldWidget(
                controller: mobileEmailController,
                isMandatoryField: true,
                hintText: context.tr(LABEL_ENTER_MOBILE_EMAIL),
                labelText:
                context.tr(LABEL_MOBILE_EMAIL),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: (String value) {
                  checkValidation();
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return context.tr(LABEL_EMPTY_MOBILE_EMAIL);
                  } else if (validationUtilities.isOnlyDigits(value)) {
                    if (value.isNotEmpty &&
                        value.length != MOBILE_NUMBER_LIMIT) {
                      return context.tr(LABEL_VALID_MOBILE);
                    }
                  } else {
                    if (!validationUtilities.isEmail(value)) {
                      return context.tr(VALID_EMAIL_ADDRESS);
                    }
                  }
                  return null;
                },
              ),
              24.verticalSpace,
              PrimaryButton(
                title: context.tr(LABEL_GET_OTP),
                backgroundColor: appColors.primaryColor,
                buttonTextColor: appColors.whiteColor,
                selectHandler: () {
                  isValidationCheck = true;
                  bool? value = checkValidation();
                  if (value != null && value) {
                    forgotPasswordAPI();
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
      );

  bool? checkValidation() {
    bool? value = false;
    if (isValidationCheck) {
      value = _formKey.currentState?.validate();
    }
    return value;
  }

  void forgotPasswordAPI() {
    BlocProvider.of<ForgotPasswordBloc>(context).add(
      ForgotpasswordEvent(
        request: ForgotPasswordRequestModel(
          mobileNo: mobileEmailController.text.trim(),
          email: mobileEmailController.text.trim(),
          type: validationUtilities
                  .isOnlyDigits(mobileEmailController.text.trim())
              ? SendOtpTo.Mobile.getSendOtpToValue
              : SendOtpTo.Email.getSendOtpToValue,
        ),
      ),
    );
  }
}
