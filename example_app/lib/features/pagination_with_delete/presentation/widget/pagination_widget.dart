import 'package:flutter/material.dart';

class PaginationWidget extends StatefulWidget {
  final Widget paginatedWidget;
  final Function onDataFetch;
  final Function? onRefresh;

  const PaginationWidget(
      {Key? key,
      required this.onDataFetch,
      required this.paginatedWidget,
      this.onRefresh})
      : super(key: key);

  @override
  _PaginationWidgetState createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  int scrollProgress = 0;

  @override
  Widget build(BuildContext context) =>
      NotificationListener<ScrollNotification>(
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
        child: RefreshIndicator(
            onRefresh: () async {
              if (widget.onRefresh != null) {
                widget.onRefresh!();
              }
            },
            child: widget.paginatedWidget),
      );
}
