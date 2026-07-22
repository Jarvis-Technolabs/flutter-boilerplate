import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/ui/widget_extension/widget_extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/widgets/shimmer/shimmer_widget.dart';

class UserListShimmerWidget extends BaseScreen {
  const UserListShimmerWidget();

  @override
  State<UserListShimmerWidget> createState() => _UserListShimmerWidgetState();
}

class _UserListShimmerWidgetState
    extends BaseScreenState<UserListShimmerWidget> {
  @override
  Widget body(_) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 20,
      itemBuilder: (_, index) {
        return ShimmerWidget(
          height: screenUtil.setHeight(170),
          width: double.maxFinite,
        ).paddingOnly(screenUtil, paddingBottom: 3);
      },
    );
  }
}
