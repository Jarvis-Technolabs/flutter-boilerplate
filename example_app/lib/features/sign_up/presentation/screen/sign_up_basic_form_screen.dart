import 'dart:async';

import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:example_app/core/ui/widgets/button.dart';
import 'package:example_app/features/splash/presentation/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/const/string_constants.dart';
import '../../../../core/localizations/app_localizations.dart';
import '../../../../core/localizations/localization_extension.dart';
import '../../../../core/ui/widgets/checkbox_widget.dart';
import '../../../../core/ui/widgets/custom_cupertino_switch_widget.dart';
import '../../../../core/ui/widgets/custom_date_picker_textfield_widget.dart';
import '../../../../core/ui/widgets/custom_textfield_widget.dart';
import '../../../../core/ui/widgets/custom_time_picker_textfield_widget.dart';
import '../../../../core/ui/widgets/dropdown_button_textfield_widget.dart';
import '../../../../core/ui/widgets/phone_code_picker_textfield.dart';
import '../../../../core/ui/widgets/radio_button_with_label.dart';
import '../../../../core/util/validation_util/validation_util.dart';
import '../../../splash/presentation/bloc/splash_bloc.dart';
import '../../../splash/presentation/bloc/splash_event.dart';

class SignUpBasicFormScreen extends BaseBlocWidget {
  @override
  State<SignUpBasicFormScreen> createState() => _SignUpBasicFormScreenState();
}

class _SignUpBasicFormScreenState
    extends BaseBlocWidgetState<SignUpBasicFormScreen> {
  String? genderGroupValue;
  StreamController<String> selectedGenderStreamController = StreamController();
  StreamController<bool> isRememberMeStreamController = StreamController();
  StreamController<bool> isTermAndConditionAcceptedStreamController =
      StreamController();

  /// Initialize TextEditingController for form fields
  TextEditingController _firstNameTextEditingController =
      TextEditingController();
  TextEditingController _lastNameTextEditingController =
      TextEditingController();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();
  TextEditingController _birthDateTextEditingController =
      TextEditingController();
  TextEditingController _phoneNoTextEditingController = TextEditingController();
  TextEditingController _favouriteWorkoutEditingController =
      TextEditingController();
  TextEditingController _favouriteWorkoutTimeTextEditingController =
      TextEditingController();
  late List<String> favouriteWorkoutList;
  String? selectedWorkout;
  bool? isRememberMe;

  bool isTermsAndConditionAccepted = false;

  /// Declare error test string variables
  String? firstNameError,
      lastNameError,
      emailError,
      passwordError,
      confirmPasswordError,
      birthdateError,
      mobileNoError,
      genderError,
      favouriteWorkoutError,
      workoutTimeError;
  StreamController<bool> _signUpFormErrorStreamController =
      StreamController.broadcast();
  
  
  @override
  void initState() {
    /// TODO - Uncomment below code to call force update
    // forceUpdateAPICall();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    /// initialize dropDownItemList
    favouriteWorkoutList = [
      context.tr(LABEL_WORKOUT_TYPE_1),
      context.tr(LABEL_WORKOUT_TYPE_2),
    ];
    super.didChangeDependencies();
  }


  void forceUpdateAPICall() async {
    String? publicToken = await preferenceHelper.getPublicToken();
    if (publicToken == null || publicToken.isEmpty) {
      BlocProvider.of<SplashBloc>(context).add(
        PublicTokenEvent(),
      );
    } else {
      BlocProvider.of<SplashBloc>(context).add(
        FetchGetMobileConfigEventDataEvent(),
      );
    }
  }

  @override
  Widget getCustomBloc() => Scaffold(
      backgroundColor: appColors.screenBgColor,
      appBar: AppBar(
        title: context.tr(LABEL_SIGN_UP_BASIC_FORM)
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
  builder: (context, state) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          child: SingleChildScrollView(
            child: StreamBuilder<bool>(
                stream: _signUpFormErrorStreamController.stream,
                builder: (context, snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFieldWidget(
                        controller: _firstNameTextEditingController,
                        labelText: context.tr(LABEL_FIRST_NAME),
                        hintText: context.tr(LABEL_FIRST_NAME),
                        errorText: firstNameError,
                        onChanged: (value) => validateFirstName(text: value),
                        isMandatoryField: true,
                        textInputAction: TextInputAction.next,
                      ).paddingOnly(screenUtil,
                          paddingBottom: 15, paddingTop: 20),
                      CustomTextFieldWidget(
                        controller: _lastNameTextEditingController,
                        labelText: context.tr(LABEL_LAST_NAME),
                        hintText: context.tr(LABEL_LAST_NAME),
                        errorText: lastNameError,
                        onChanged: (value) => validateLastName(text: value),
                        isMandatoryField: true,
                        textInputAction: TextInputAction.next,
                      ).paddingOnly(screenUtil, paddingBottom: 15),
                      CustomTextFieldWidget(
                        controller: _emailTextEditingController,
                        labelText: context.tr(LABEL_EMAIL_ADDRESS),
                        hintText: context.tr(LABEL_EMAIL_ADDRESS),
                        errorText: emailError,
                        onChanged: (value) => validateEmail(text: value),
                        isMandatoryField: true,
                        textInputAction: TextInputAction.next,
                      ).paddingOnly(screenUtil, paddingBottom: 15),
                      CustomTextFieldWidget(
                        controller: _passwordTextEditingController,
                        labelText: context.tr(LABEL_PASSWORD),
                        hintText: context.tr(LABEL_PASSWORD),
                        errorText: passwordError,
                        onChanged: (value) => validatePassword(text: value),
                        isMandatoryField: true,
                        textInputAction: TextInputAction.next,
                      ).paddingOnly(
                        screenUtil,
                        paddingBottom: 15,
                      ),
                      CustomTextFieldWidget(
                        keyboardType: TextInputType.number,
                        controller: _confirmPasswordTextEditingController,
                        labelText: context.tr(LABEL_CONFIRM_PASSWORD),
                        hintText: context.tr(LABEL_CONFIRM_PASSWORD),
                        errorText: confirmPasswordError,
                        onChanged: (value) =>
                            validateConfirmPassword(text: value),
                        isMandatoryField: true,
                        textInputAction: TextInputAction.next,
                      ).paddingOnly(
                        screenUtil,
                        paddingBottom: 15,
                      ),
                      CustomDatePickerTextFieldWidget(
                        controller: _birthDateTextEditingController,
                        labelText: context.tr(LABEL_BIRTH_DATE),
                        hintText: context.tr(LABEL_BIRTH_DATE),
                        suffixIconWidget: Icon(
                          Icons.calendar_month,
                          color: appColors.primaryColor,
                        ),
                        errorText: birthdateError,
                        isMandatoryField: true,
                        onChanged: (String value) {
                          validateBirthDate(text: value);
                        },
                      ).paddingOnly(
                        screenUtil,
                        paddingBottom: 15,
                      ),
                      PhoneCodePickerTextField(
                        controller: _phoneNoTextEditingController,
                        languageCode: 'en',
                        initialCountryCode: "IN",
                        onPhoneNumberChange: (PhoneNumber) {},
                        labelText: context.tr(LABEL_PHONE_NUMBER),
                        errorText: mobileNoError,
                        isMandatoryField: true,
                        inputDecoration: InputDecoration(
                          helperText: "",
                          contentPadding: EdgeInsets.fromLTRB(
                              screenUtil.setWidth(0),
                              screenUtil.setHeight(18),
                              screenUtil.setWidth(15),
                              screenUtil.setHeight(18)),
                          hintText: context.tr(LABEL_PHONE_NUMBER),
                          errorMaxLines: 2,
                          hintStyle: getFormHintTextStyle(
                              screenUtil: screenUtil, appColors: appColors),
                          filled: true,
                          fillColor: appColors.transparentColor,
                          border: InputBorder.none,
                          errorStyle: getFormErrorTextStyle(
                              screenUtil: screenUtil, appColors: appColors),
                          enabledBorder: outlineInputBorder(
                              appColors: appColors, screenUtil: screenUtil),
                          focusedBorder: outlineInputBorder(
                              borderColor: appColors.primaryColor,
                              appColors: appColors,
                              screenUtil: screenUtil),
                          errorBorder: outlineInputBorder(
                              borderColor: appColors.dividerColor,
                              appColors: appColors,
                              screenUtil: screenUtil),
                          disabledBorder: outlineInputBorder(
                              appColors: appColors, screenUtil: screenUtil),
                          focusedErrorBorder: outlineInputBorder(
                              appColors: appColors, screenUtil: screenUtil),
                        ),
                      ).paddingOnly(screenUtil, paddingBottom: 15),
                      StreamBuilder<String>(
                          stream: selectedGenderStreamController.stream,
                          builder: (context, snapshot) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    context.tr(LABEL_GENDER)
                                        .getTextColor17W500Inter(
                                            screenUtil: screenUtil,
                                            appColors: appColors),
                                    "*"
                                        .getFormLabelTextInter(
                                            screenUtil: screenUtil,
                                            appColors: appColors)
                                        .paddingOnly(screenUtil,
                                            paddingLeft: 5),
                                  ],
                                ).paddingOnly(screenUtil, paddingBottom: 7),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RadioButtonWithLabelWidget(
                                      groupValue: genderGroupValue,
                                      title: context.tr(LABEL_MALE),
                                      selectedValue: (dynamic value) {
                                        genderGroupValue = value.toString();
                                        selectedGenderStreamController
                                            .add(genderGroupValue!);
                                        validateGender(text: genderGroupValue!);
                                      },
                                    ).paddingOnly(screenUtil, paddingRight: 20),
                                    RadioButtonWithLabelWidget(
                                      groupValue: genderGroupValue,
                                      title: context.tr(LABEL_FEMALE),
                                      selectedValue: (dynamic value) {
                                        genderGroupValue = value.toString();
                                        selectedGenderStreamController
                                            .add(genderGroupValue!);
                                        validateGender(text: genderGroupValue!);
                                      },
                                    ).paddingOnly(screenUtil, paddingRight: 20),
                                  ],
                                ),
                              ],
                            ).paddingOnly(screenUtil, paddingBottom: 25);
                          }),
                      DropdownButtonTextFieldWidget(
                        onItemSelectionChange: (String value) {
                          _favouriteWorkoutEditingController.text = value;
                          validateFavouriteWorkout(text: value);
                        },
                        dropDownList: favouriteWorkoutList,
                        labelText: context.tr(LABEL_FAVOURITE_WORKOUT),
                        errorText: favouriteWorkoutError,
                        isMandatoryField: true,
                        selectedValue: null,
                        inputDecoration: InputDecoration(
                          helperText: "",
                          contentPadding: EdgeInsets.fromLTRB(
                              screenUtil.setWidth(15),
                              screenUtil.setHeight(15),
                              screenUtil.setWidth(15),
                              screenUtil.setHeight(15)),
                          hintText: context.tr(LABEL_FAVOURITE_WORKOUT),
                          errorMaxLines: 2,
                          hintStyle: getFormHintTextStyle(
                              screenUtil: screenUtil, appColors: appColors),
                          filled: true,
                          fillColor: appColors.transparentColor,
                          border: InputBorder.none,
                          enabledBorder: outlineInputBorder(
                              appColors: appColors, screenUtil: screenUtil),
                          focusedBorder: outlineInputBorder(
                              borderColor: appColors.primaryColor,
                              appColors: appColors,
                              screenUtil: screenUtil),
                          errorBorder: outlineInputBorder(
                              borderColor: appColors.dividerColor,
                              appColors: appColors,
                              screenUtil: screenUtil),
                          disabledBorder: outlineInputBorder(
                              appColors: appColors, screenUtil: screenUtil),
                          focusedErrorBorder: outlineInputBorder(
                              appColors: appColors, screenUtil: screenUtil),
                        ),
                      ).paddingOnly(
                        screenUtil,
                        paddingBottom: 15,
                      ),
                      CustomTimePickerTextFieldWidget(
                        controller: _favouriteWorkoutTimeTextEditingController,
                        onChanged: (String value) {
                          _favouriteWorkoutTimeTextEditingController.text =
                              value;
                          validateWorkoutTime(text: value);
                        },
                        labelText: context.tr(
                            LABEL_PREFERRED_REMINDER_TIME_FOR_WORKOUT),
                        hintText: context.tr(
                            LABEL_PREFERRED_REMINDER_TIME_FOR_WORKOUT),
                        errorText: workoutTimeError,
                        isMandatoryField: true,
                      ).paddingOnly(
                        screenUtil,
                        paddingBottom: 15,
                      ),
                      StreamBuilder<bool>(
                          stream: isRememberMeStreamController.stream,
                          initialData: false,
                          builder: (context, snapshot) {
                            isRememberMe = snapshot.data;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                context.tr(LABEL_REMEMBER_ME)
                                    .getTextColor17W500Inter(
                                        screenUtil: screenUtil,
                                        appColors: appColors)
                                    .paddingOnly(screenUtil),
                                CustomCupertinoSwitchWidget(
                                  transformScale: 0.7,
                                  onSwitchValueChange: (bool value) {
                                    isRememberMeStreamController.add(value);
                                  },
                                  activeColor: appColors.primaryColor,
                                  trackColor: appColors.secondaryColor,
                                  switchValue: isRememberMe!,
                                )
                              ],
                            ).paddingOnly(screenUtil, paddingBottom: 20);
                          }),
                      StreamBuilder<bool>(
                          stream:
                              isTermAndConditionAcceptedStreamController.stream,
                          initialData: false,
                          builder: (context, snapshot) {
                            isTermsAndConditionAccepted = snapshot.data!;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CheckboxWidget(
                                  fillColor: appColors.primaryColor,
                                  checkColor: appColors.whiteColor,
                                  height: 15,
                                  width: 20,
                                  selectedValue: (bool value) {
                                    isTermAndConditionAcceptedStreamController
                                        .add(value);
                                  },
                                  isCheck: isTermsAndConditionAccepted,
                                ).paddingOnly(screenUtil, paddingRight: 10),
                                Expanded(
                                  child: context.tr(LABEL_TERMS_AND_CONDITION_DESC)
                                      .getTextColor15W400Inter(
                                          maxLine: 3,
                                          screenUtil: screenUtil,
                                          appColors: appColors)
                                      .paddingOnly(screenUtil),
                                ),
                              ],
                            );
                          }).paddingOnly(screenUtil, paddingBottom: 32),
                      StreamBuilder<bool>(
                          stream: _signUpFormErrorStreamController.stream,
                          initialData: false,
                          builder: (context, snapshot) {
                            bool isEnabled = isSignUpButtonEnabled();
                            return PrimaryButton(
                              title: context.tr(LABEL_SIGN_UP),
                              backgroundColor: appColors.primaryColor,
                              buttonTextColor: appColors.whiteColor,
                              selectHandler: isEnabled ? () {} : null,
                            ).paddingOnly(screenUtil, paddingBottom: 32);
                          }),
                    ],
                  );
                }),
          ),
        ).paddingAll(padding: 20, screenUtil: screenUtil),
      );
  },
));

  /// enable button based on validation
  bool isSignUpButtonEnabled() {
    if (firstNameError == null &&
        lastNameError == null &&
        emailError == null &&
        passwordError == null &&
        confirmPasswordError == null &&
        _birthDateTextEditingController.text.isNotEmpty &&
        _phoneNoTextEditingController.text.isNotEmpty &&
        genderGroupValue != null &&
        _favouriteWorkoutEditingController.text.isNotEmpty &&
        _favouriteWorkoutTimeTextEditingController.text.isNotEmpty &&
        isTermsAndConditionAccepted == true) {
      _signUpFormErrorStreamController.add(true);
      return true;
    } else {
      _signUpFormErrorStreamController.add(false);
      return false;
    }
  }

  /// validate firstName
  validateFirstName({required String text}) {
    if (text.isEmpty) {
      firstNameError =
          context.tr(LABEL_EMPTY_FIRSTNAME);
      _signUpFormErrorStreamController.add(true);
    } else if (text.length < 3) {
      firstNameError =
          context.tr(LABEL_VALID_FIRSTNAME);
      _signUpFormErrorStreamController.add(true);
    } else {
      firstNameError = null;
      _signUpFormErrorStreamController.add(false);
    }
  }

  /// validate lastName
  validateLastName({required String text}) {
    if (text.isEmpty) {
      lastNameError =
          context.tr(LABEL_EMPTY_LASTNAME);
      _signUpFormErrorStreamController.add(true);
    } else if (text.length < 3) {
      lastNameError =
          context.tr(LABEL_VALID_LASTNAME);
      _signUpFormErrorStreamController.add(true);
    } else {
      lastNameError = null;
      _signUpFormErrorStreamController.add(false);
    }
  }

  /// validate email
  validateEmail({required String text}) {
    if (text.isEmpty) {
      emailError =
          context.tr(LABEL_EMPTY_EMAIL_ADDRESS);
      _signUpFormErrorStreamController.add(true);
    } else if (!ValidationUtil().isEmail(text)) {
      emailError =
          context.tr(LABEL_VALID_EMAIL_ADDRESS);
      _signUpFormErrorStreamController.add(true);
    } else {
      emailError = null;
      _signUpFormErrorStreamController.add(false);
    }
  }

  /// validate password
  validatePassword({required String text}) {
    if (text.isEmpty) {
      passwordError =
          context.tr(LABEL_EMPTY_PASSWORD);
      _signUpFormErrorStreamController.add(true);
    } else if (!ValidationUtil().isPasswordValid(text)) {
      passwordError =
          context.tr(LABEL_VALID_PASSWORD);
      _signUpFormErrorStreamController.add(true);
    } else {
      passwordError = null;
      _signUpFormErrorStreamController.add(false);
    }
  }

  /// validate conFirmPassword
  validateConfirmPassword({required String text}) {
    if (text.isEmpty) {
      confirmPasswordError =
          context.tr(LABEL_EMPTY_CONFIRM_PASSWORD);
      _signUpFormErrorStreamController.add(true);
    } else if (_passwordTextEditingController.text !=
        _confirmPasswordTextEditingController.text) {
      confirmPasswordError =
          context.tr(LABEL_VALID_CONFIRM_PASSWORD);
      _signUpFormErrorStreamController.add(true);
    } else {
      confirmPasswordError = null;
      _signUpFormErrorStreamController.add(false);
    }
  }

  /// validate birthDate
  validateBirthDate({required String text}) {
    if (text.isEmpty) {
      birthdateError =
          context.tr(LABEL_EMPTY_BIRTHDATE);
      _signUpFormErrorStreamController.add(true);
    } else {
      birthdateError = null;
      _signUpFormErrorStreamController.add(false);
    }
  }

  /// validate gender radio selected value
  validateGender({required String? text}) {
    if (text == "" || text == null) {
      genderError = context.tr(LABEL_EMPTY_GENDER);
      _signUpFormErrorStreamController.add(true);
    } else {
      genderError = null;
      _signUpFormErrorStreamController.add(false);
    }
  }

  /// validate favouriteWorkout dropdown value
  validateFavouriteWorkout({required String text}) {
    if (text.isEmpty) {
      favouriteWorkoutError =
          context.tr(LABEL_EMPTY_FAVOURITE_WORKOUT);
      _signUpFormErrorStreamController.add(true);
    } else {
      favouriteWorkoutError = null;
      _signUpFormErrorStreamController.add(false);
    }
  }

  /// validate timePicker field selected value
  validateWorkoutTime({required String text}) {
    if (text.isEmpty) {
      workoutTimeError = context.tr(LABEL_EMPTY_PREFERRED_REMINDER_TIME_FOR_WORKOUT);
      _signUpFormErrorStreamController.add(true);
    } else {
      workoutTimeError = null;
      _signUpFormErrorStreamController.add(false);
    }
  }
}
