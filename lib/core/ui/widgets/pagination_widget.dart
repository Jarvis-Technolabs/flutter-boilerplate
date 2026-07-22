import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';
import 'package:flutter_clean_architecture/core/const/app_constants.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/loading_indicator.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/no_%20records_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaginationWidget extends BaseScreen {
  final Function() onDataFetch;
  final Function() onRefresh;
  final int totalRecordsCount;
  final int itemCount;
  final int currentPage;
  final bool isHandleEmptyWidget;
  final String? title;
  final String? message;
  final StreamController<bool> paginationLoadingStreamController;
  final IndexedWidgetBuilder? separatorBuilder;
  final Widget Function(BuildContext, int) itemBuilder;
  final double? extraMaxScrollExtent;

  const PaginationWidget({
    Key? key,
    required this.onDataFetch,
    required this.onRefresh,
    required this.totalRecordsCount,
    required this.itemCount,
    required this.currentPage,
    required this.paginationLoadingStreamController,
    required this.itemBuilder,
    this.title,
    this.message,
    this.separatorBuilder,
    this.extraMaxScrollExtent,
    this.isHandleEmptyWidget = true,
  }) : super(key: key);

  @override
  _PaginationWidgetState createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends BaseScreenState<PaginationWidget> {
  int scrollProgress = 0;
  bool showLoading = false;
  final ScrollController scrollController = ScrollController();

  @override
  Widget body(_) => NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          int progress = 0;
          if (notification.metrics.pixels != 0 &&
              notification.metrics.maxScrollExtent != 0) {
            progress = ((notification.metrics.pixels /
                        notification.metrics.maxScrollExtent) *
                    100)
                .toInt();
          }
          if (progress != scrollProgress) {
            scrollProgress = progress;
            if (scrollProgress == 100) {
              if (!showLoading &&
                  widget.itemCount != widget.totalRecordsCount) {
                if (widget.currentPage + 1 <=
                    (widget.totalRecordsCount / PER_PAGE_ITEM_COUNT).ceil()) {
                  showLoadingWidget();
                  widget.onDataFetch();
                }
              }
            }
          }
          return true;
        },
        child: widget.isHandleEmptyWidget && widget.totalRecordsCount > 0 ||
                !widget.isHandleEmptyWidget
            ? StreamBuilder<bool>(
                initialData: showLoading,
                stream: widget.paginationLoadingStreamController.stream,
                builder: (_, snapshot) {
                  showLoading = snapshot.data ?? showLoading;
                  if (showLoading) {
                    scrollController.jumpTo(
                        scrollController.position.maxScrollExtent +
                            (widget.extraMaxScrollExtent ?? 76.h));
                  }
                  return RefreshIndicator(
                    color: appColors.primaryColor,
                    backgroundColor: appColors.whiteColor,
                    onRefresh: () async {
                      widget.onRefresh();
                    },
                    child: ListView.separated(
                      controller: scrollController,
                      itemCount:
                          showLoading ? widget.itemCount + 1 : widget.itemCount,
                      separatorBuilder: widget.separatorBuilder ??
                          (_, index) => SizedBox.shrink(),
                      itemBuilder: (_, index) =>
                          (showLoading && index == widget.itemCount)
                              ? PaginationCircularProgressIndicator()
                              : widget.itemBuilder(_, index),
                    ),
                  );
                },
              )
            : Center(
                child: NoRecordsWidget(
                  title: widget.title,
                  message: widget.message,
                ),
              ),
      );

  void showLoadingWidget() {
    showLoading = true;
    widget.paginationLoadingStreamController.add(showLoading);
  }

  void removeLoadingWidget() {
    showLoading = false;
    widget.paginationLoadingStreamController.add(showLoading);
  }
}

class CustomPaginationWidget extends BaseScreen {
  final Widget child;
  final Function onDataFetch;
  final int totalRecords;
  final bool isHandleEmptyWidget;
  final String? title;
  final String? message;

  const CustomPaginationWidget({
    Key? key,
    required this.onDataFetch,
    required this.child,
    required this.totalRecords,
    this.title,
    this.message,
    this.isHandleEmptyWidget = true,
  }) : super(key: key);

  @override
  _CustomPaginationWidgetState createState() => _CustomPaginationWidgetState();
}

class _CustomPaginationWidgetState
    extends BaseScreenState<CustomPaginationWidget> {
  int scrollProgress = 0;

  @override
  Widget body(BuildContext context) => NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          int progress = 0;
          if (notification.metrics.pixels != 0 &&
              notification.metrics.maxScrollExtent != 0) {
            progress = ((notification.metrics.pixels /
                        notification.metrics.maxScrollExtent) *
                    100)
                .toInt();
          }
          if (progress != scrollProgress) {
            scrollProgress = progress;
            if (scrollProgress == 100) {
              widget.onDataFetch();
            }
          }
          return true;
        },
        child: widget.isHandleEmptyWidget && widget.totalRecords > 0 ||
                !widget.isHandleEmptyWidget
            ? widget.child
            : Center(
                child: NoRecordsWidget(
                  title: widget.title,
                  message: widget.message,
                ),
              ),
      );
}
