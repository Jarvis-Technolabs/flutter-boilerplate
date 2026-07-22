import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';
import 'package:flutter_clean_architecture/core/ui/widget_extension/widget_extension.dart';

class CommonCircularProgressIndicator extends BaseScreen {
  const CommonCircularProgressIndicator({
    super.key,
  });

  @override
  State<CommonCircularProgressIndicator> createState() =>
      _CommonCircularProgressIndicatorState();
}

class _CommonCircularProgressIndicatorState
    extends BaseScreenState<CommonCircularProgressIndicator> {
  @override
  Widget body(_) => Center(
        child: SizedBox(
          height: screenUtil.setWidth(40.0),
          width: screenUtil.setWidth(40.0),
          child: RepaintBoundary(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation<Color>(
                appColors.primaryColor,
              ),
              backgroundColor: appColors.whiteColor,
            ),
          ),
        ),
      );
}

class PaginationCircularProgressIndicator extends BaseScreen {
  const PaginationCircularProgressIndicator({
    super.key,
  });

  @override
  State<PaginationCircularProgressIndicator> createState() =>
      _PaginationCircularProgressIndicatorState();
}

class _PaginationCircularProgressIndicatorState
    extends BaseScreenState<PaginationCircularProgressIndicator> {
  @override
  Widget body(_) => CommonCircularProgressIndicator().paddingAll(
        padding: 18,
        screenUtil: screenUtil,
      );
}
