import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:example_app/core/base/screen/base_bloc_widget.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:flutter/material.dart';

import '../../../core/const/string_constants.dart';
import '../../../core/localizations/app_localizations.dart';
import '../../../core/localizations/localization_extension.dart';

class CommonEmailMobileTextviewWidget extends BaseBlocWidget {
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  Function? onTap, onClear;
  Widget? buildItem;
  Country? selectedCountry;
  StreamController<Country>? countryController;

  final bool isNumber;
  CommonEmailMobileTextviewWidget(
      {required this.controller,
      this.onChanged,
      this.onTap,
      this.onClear,
      this.isNumber = false,
      this.buildItem,
      this.selectedCountry,
      this.countryController});

  @override
  State<CommonEmailMobileTextviewWidget> createState() =>
      _CommonEmailMobileTextviewWidgetState();
}

class _CommonEmailMobileTextviewWidgetState
    extends BaseBlocWidgetState<CommonEmailMobileTextviewWidget> {
  @override
  Widget getCustomBloc() => Padding(
        padding: EdgeInsets.all(screenUtil.setWidth(30)),
        child: Center(
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: appColors.textColor),
                borderRadius:
                    BorderRadius.all(Radius.circular(screenUtil.setWidth(8))),
              ),
              child: Row(
                children: [
                  widget.isNumber
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                widget.onTap!();
                              },
                              child: StreamBuilder<Country>(
                                  initialData: widget.selectedCountry,
                                  stream: widget.countryController?.stream,
                                  builder: (_, snapshot) => Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          SizedBox(
                                              width: screenUtil.setWidth(15.0)),
                                          "+${widget.selectedCountry?.phoneCode}"
                                              .getTextColor15W500Inter(
                                                  screenUtil: screenUtil,
                                                  appColors: appColors)
                                        ],
                                      )),
                            ),
                            Container(
                              height: screenUtil.setHeight(25),
                              width: screenUtil.setWidth(1.5),
                              color: appColors.subtextColor,
                              margin: EdgeInsets.only(
                                  right: screenUtil.setWidth(15),
                                  left: screenUtil.setWidth(15)),
                            ),
                          ],
                        )
                      : SizedBox(width: screenUtil.setWidth(10)),
                  Expanded(
                    child: TextFormField(
                      controller: widget.controller,
                      keyboardType: TextInputType.name,
                      cursorColor: appColors.textColor,
                      style: getFormTextStyle(
                          screenUtil: screenUtil, appColors: appColors),
                      decoration: InputDecoration(
                        suffixIcon: widget.controller.text.isEmpty
                            ? const SizedBox()
                            : IconButton(
                                onPressed: () {
                                  widget.onClear!();
                                },
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: appColors.primaryColor,
                                )),
                        contentPadding: EdgeInsets.only(
                          top: screenUtil.setHeight(10),
                          bottom: screenUtil.setHeight(5),
                          left: screenUtil.setWidth(5),
                          right: screenUtil.setWidth(10),
                        ),
                        hintText: context.tr(LABEL_EMAIL_MOBILE),
                        hintStyle: getFormHintTextStyle(
                            screenUtil: screenUtil, appColors: appColors),
                        counterText: "",
                        border: InputBorder.none,
                        alignLabelWithHint: false,
                      ),
                      onChanged: (val) {
                        widget.onChanged!(val);
                      },
                    ),
                  ),
                ],
              )),
        ),
      );
}
