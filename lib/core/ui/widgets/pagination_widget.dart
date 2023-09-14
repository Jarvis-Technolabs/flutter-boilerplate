import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/screen/base_screen.dart';
import 'package:flutter_clean_architecture/core/ui/widgets/no_%20records_widget.dart';

class PaginationWidget extends BaseScreen {
  final Widget child;
  final Function onDataFetch;
  final int totalRecords;
  final bool isHandleEmptyWidget;
  final String? title;
  final String? message;

  const PaginationWidget(
      {Key? key,
      required this.onDataFetch,
      required this.child,
      required this.totalRecords,
      this.title,
      this.message,
      this.isHandleEmptyWidget = true})
      : super(key: key);

  @override
  _PaginationWidgetState createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends BaseScreenState<PaginationWidget> {
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
