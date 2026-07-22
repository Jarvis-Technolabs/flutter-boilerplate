import 'package:example_app/core/base/screen/base_screen.dart';
import 'package:example_app/core/ui/widgets/no_%20records_widget.dart';
import 'package:flutter/material.dart';

class PaginationWidget extends BaseScreen {
  final Widget listViewWidget;
  final int initialPage;
  final int totalPage;
  final int currentPage;
  final Color refreshIndicatorColor;
  final Color refreshIndicatorBackgroundColor;
  final Function(int currentPage) onDataFetch;
  final Function onPullToRefresh;
  final bool isHandleEmptyWidget;
  final String? emptyWidgetTitle;
  final String? emptyWidgetMessage;

  PaginationWidget({
    Key? key,
    required this.onDataFetch,
    required this.currentPage,
    required this.totalPage,
    required this.initialPage,
    required this.refreshIndicatorColor,
    required this.refreshIndicatorBackgroundColor,
    required this.onPullToRefresh,
    required this.listViewWidget,
    this.emptyWidgetTitle,
    this.emptyWidgetMessage,
    this.isHandleEmptyWidget = true,
  }) : super(key: key);

  @override
  _PaginationWidgetState createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends BaseScreenState<PaginationWidget> {
  int scrollProgress = 0;

  @override
  Widget body(_) => NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          int progress = 0;

          /// below logic for track scroll progress
          if (notification.metrics.pixels != 0 &&
              notification.metrics.maxScrollExtent != 0) {
            progress = ((notification.metrics.pixels /
                        notification.metrics.maxScrollExtent) *
                    100)
                .toInt();
          }
          if (progress != scrollProgress) {
            scrollProgress = progress;

            /// when progress is 100 and totalPages not loading then call onDataFetch function
            if (scrollProgress == 100) {
              if (widget.currentPage < widget.totalPage) {
                widget.onDataFetch(widget.currentPage + 1);
              }
            }
          }
          return true;
        },
        child: !widget.isHandleEmptyWidget
            ? RefreshIndicator(
                backgroundColor: widget.refreshIndicatorBackgroundColor,
                color: widget.refreshIndicatorColor,
                onRefresh: () async {
                  widget.onPullToRefresh(widget.initialPage);
                },
                child: widget.listViewWidget)
            : Center(
                child: NoRecordsWidget(
                  title: widget.emptyWidgetTitle,
                  message: widget.emptyWidgetMessage,
                ),
              ),
      );
}
