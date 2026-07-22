import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/localizations/localization_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/const/string_constants.dart';
import '../../../core/localizations/app_localizations.dart';
import '../widget/common_email_mobile_textview_widget.dart';

class EmailMobileTextviewScreen extends BaseBlocWidget {
  @override
  State<EmailMobileTextviewScreen> createState() =>
      _EmailMobileTextviewScreenState();
}

class _EmailMobileTextviewScreenState
    extends BaseBlocWidgetState<EmailMobileTextviewScreen> {
  final controller = TextEditingController();

  bool isNumber = false;
  StreamController<bool> streamController = StreamController.broadcast();
  Country _selectedDialogCountry = Country.parse('in');
  final StreamController<Country> _countryController =
      StreamController<Country>.broadcast();

  @override
  Widget getCustomBloc() => Scaffold(
      backgroundColor: appColors.screenBgColor,
      appBar: AppBar(
        foregroundColor: appColors.whiteColor,
        title: Text(context.tr(LABEL_EMAIL_MOBILE_TEXTVIEW)),
      ),
      body: StreamBuilder<bool>(
          stream: streamController.stream,
          builder: (_, snapshot) => CommonEmailMobileTextviewWidget(
                controller: controller,
                isNumber: isNumber,
                selectedCountry: _selectedDialogCountry,
                countryController: _countryController,
                onChanged: (val) {
                  if (controller.text.isEmpty && isNumber) {
                    isNumber = false;
                  }
                  if (controller.text.length == 1) {
                    if (_isNumeric(val)) {
                      isNumber = true;
                    }
                  }
                  streamController.add(isNumber);
                },
                onClear: () {
                  controller.clear();
                  isNumber = false;
                  streamController.add(isNumber);
                },
                onTap: () {
                  openCountryPickerDialog(context, (Country country) {
                    _selectedDialogCountry = country;
                    _countryController.add(_selectedDialogCountry);
                  });
                },
              )));

  void openCountryPickerDialog(BuildContext context, Function onValueFetched) =>
      showCountryPicker(
        showSearch: true,
        context: context,

        ///Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
        exclude: <String>['KN', 'MF'],
        favorite: <String>['SE'],

        ///Optional. Shows phone code before the country name.
        showPhoneCode: true,
        onSelect: (Country country) {
          onValueFetched(country);
        },

        /// Optional. Sets the theme for the country list picker.
        countryListTheme: CountryListThemeData(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          inputDecoration: InputDecoration(
            hintText: context.tr(LABEL_SEARCH),
            prefixIcon: Icon(
              Icons.search,
              color: appColors.primaryColor,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: appColors.primaryColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: appColors.subtextColor,
              ),
            ),
            counterText: "",
            alignLabelWithHint: false,
          ),

          /// Optional. Styles the text in the search field
          searchTextStyle: TextStyle(
            color: appColors.textColor,
            fontSize: screenUtil.setSp(16),
          ),
        ),
      );

  bool _isNumeric(String result) {
    if (result.isEmpty) {
      return false;
    }
    return double.tryParse(result) != null;
  }
}
