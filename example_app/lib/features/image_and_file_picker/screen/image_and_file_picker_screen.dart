import 'dart:io';
import 'package:example_app/core/const/string_constants.dart';
import 'package:example_app/core/localizations/app_localizations.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/features/image_and_file_picker/widget/file_list_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_and_file_picker_utility/image_and_file_picker_utility.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../../core/base/screen/base_bloc_widget.dart';
import '../../../core/localizations/localization_extension.dart';
import '../../../core/ui/widgets/outline_common_button.dart';

class ImageAndFilePickerScreen extends BaseBlocWidget {
  @override
  State<ImageAndFilePickerScreen> createState() =>
      _ImageAndFilePickerScreenState();
}

class _ImageAndFilePickerScreenState
    extends BaseBlocWidgetState<ImageAndFilePickerScreen> {
  List<File> files = [];

  @override
  Widget getCustomBloc() => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.tr(LABEL_FILES)
                    .getBlackColor17W500Inter(
                      screenUtil: screenUtil,
                      appColors: appColors,
                    ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: files.length + 1,
                    itemBuilder: (context, index) {
                      if (index == files.length) {
                        return SizedBox.shrink();
                      }
                      return FileListItem(
                        file: files[index],
                        onPressed: () {},
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlineCommonButton(
                      title: context.tr(LABEL_PICK_IMAGE),
                      buttonTextColor: appColors.whiteColor,
                      selectHandler: () async {
                        await ImagePickerUtil().showImagePickerBottomSheet(
                            context: context,
                            isCropImage: true,
                            savePickedCameraImageToStorage: true,
                            pickImageImageQuality: 100,
                            cropImagePlatformUiSettings: [
                              AndroidUiSettings(
                                  toolbarTitle: 'Cropper',
                                  toolbarColor: appColors.primaryColor,
                                  toolbarWidgetColor: appColors.whiteColor,
                                  initAspectRatio:
                                      CropAspectRatioPreset.original,
                                  lockAspectRatio: false),
                              IOSUiSettings(
                                title: 'Cropper',
                              ),
                            ],
                            onImageSelection: (File? pickedImage) {
                              if (pickedImage != null) {
                                setState(() {
                                  files.add(pickedImage);
                                });
                              }
                            });
                      },
                      backgroundColor: appColors.primaryColor,
                      borderColor: appColors.primaryColor,
                    ),
                    OutlineCommonButton(
                      title: context.tr(LABEL_PICK_FILES),
                      buttonTextColor: appColors.whiteColor,
                      selectHandler: () async {
                        final List<File>? pickedFileList =
                            await FilePickerUtil().getFilePicker(
                          allowMultiple: true,
                          allowCompression: true,
                          fileType: FileType.any,

                          /// When you want to pick specific extensions files then choose type as FileType.custom and pass the extensions using allowedExtensions parameter
                          // fileType:FileType.custom,
                          // allowedExtensions: ['jpg', 'pdf', 'doc'],
                          context: context,
                        );
                        if (pickedFileList != null &&
                            pickedFileList.isNotEmpty) {
                          for (var file in pickedFileList) {
                            setState(() {
                              files.add(file);
                            });
                          }
                        }
                      },
                      backgroundColor: appColors.primaryColor,
                      borderColor: appColors.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
