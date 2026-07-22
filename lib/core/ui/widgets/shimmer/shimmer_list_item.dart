import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/shimmer/shimmer_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerListItemWidget extends BaseScreen {
  ShimmerListItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ShimmerListItemWidget> createState() => _ShimmerListItemWidgetState();
}

class _ShimmerListItemWidgetState
    extends BaseScreenState<ShimmerListItemWidget> {
  @override
  Widget body(_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget(
            width: (MediaQuery.of(context).size.width - 36) / 2,
            height: 20.h,
          ),
          SizedBox(
            height: 8.h,
          ),
          ShimmerWidget(
            width: (MediaQuery.of(context).size.width - 16),
            height: 20.h,
          )
        ],
      );
}
