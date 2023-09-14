import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends BaseScreen {
  final double? width;
  final double? height;

  ShimmerWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends BaseScreenState<ShimmerWidget> {
  @override
  Widget body(_) => SizedBox(
        width: widget.width != null
            ? screenUtil.setWidth(widget.width!)
            : double.infinity,
        height: widget.height != null
            ? screenUtil.setHeight(widget.height!)
            : double.infinity,
        child: Shimmer.fromColors(
          baseColor: appColors.shimmerBaseColor,
          highlightColor: appColors.shimmerHighlightColor,
          child: Container(
            color: appColors.shimmerBaseColor,
          ),
        ),
      );
}
