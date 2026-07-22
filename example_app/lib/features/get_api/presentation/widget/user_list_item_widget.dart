import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/ui/theme/text_style_extension/text_style_extension.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../data/model/user_list_response.dart';

class UserListItemWidget extends BaseScreen {
  final Data user;
  const UserListItemWidget({
    required this.user,
  });

  @override
  State<UserListItemWidget> createState() => _UserListItemWidgetState();
}

class _UserListItemWidgetState extends BaseScreenState<UserListItemWidget> {
  @override
  Widget body(_) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.user.firstName!.getTextColor17W500Inter(
                  screenUtil: screenUtil, appColors: appColors),
            ],
          ).paddingSymmetric(
              horizontalPadding: 20,
              verticalPadding: 80,
              screenUtil: screenUtil),
          Divider(
            color: appColors.dividerColor,
            thickness: screenUtil.setHeight(1),
            height: screenUtil.setHeight(1),
          ),
        ],
      );
}
