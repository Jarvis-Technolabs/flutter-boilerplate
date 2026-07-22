import 'dart:io';

import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/const/string_constants.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:image_and_file_picker_utility/image_and_file_picker_utility.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/localizations/app_localizations.dart';
import '../../../core/localizations/localization_extension.dart';
import '../../../core/ui/widgets/button.dart';

class ShareExampleScreen extends BaseScreen {
  const ShareExampleScreen({Key? key}) : super(key: key);

  @override
  State<ShareExampleScreen> createState() => _ShareExampleScreenState();
}

class _ShareExampleScreenState extends BaseScreenState<ShareExampleScreen> {
  @override
  Widget body(BuildContext context) => Scaffold(
        backgroundColor: appColors.screenBgColor,
        appBar: AppBar(
          title: context.tr(LABEL_SHARE_EXAMPLE)
              .getWhiteColor17W500Inter(
                  screenUtil: screenUtil, appColors: appColors),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            context.tr(LABEL_TEXT_OR_LINK)
                .getTextColor28W600Inter(
                    screenUtil: screenUtil, appColors: appColors)
                .paddingOnly(
                  screenUtil,
                  paddingBottom: 30,
                ),
            PrimaryButton(
              title: context.tr(LABEL_TEXT_OR_LINK),
              backgroundColor: appColors.primaryColor,
              buttonTextColor: appColors.whiteColor,
              selectHandler: () async {
                /// share image or link
                Share.share('Check out my website https://google.com',
                    subject: "Share Example");
              },
            ).paddingOnly(
              screenUtil,
              paddingBottom: 60,
            ),
            context.tr(LABEL_SHARE_FILE)
                .getTextColor28W600Inter(
                    screenUtil: screenUtil, appColors: appColors)
                .paddingOnly(
                  screenUtil,
                  paddingBottom: 30,
                ),
            PrimaryButton(
              title: context.tr(LABEL_SHARE_FILE),
              backgroundColor: appColors.primaryColor,
              buttonTextColor: appColors.whiteColor,
              selectHandler: () async {
                /// share file
                await ImagePickerUtil().showImagePickerBottomSheet(
                    context: context,
                    onImageSelection: (File? pickedImage) {
                      if (pickedImage != null) {
                        Future.delayed(Duration(seconds: 1), () {
                          Share.shareXFiles([XFile(pickedImage.path)]);
                        });
                      }
                    });
              },
            ).paddingOnly(
              screenUtil,
              paddingBottom: 20,
            ),
          ],
        ).paddingAll(
          padding: 20,
          screenUtil: screenUtil,
        ),
      );
}
