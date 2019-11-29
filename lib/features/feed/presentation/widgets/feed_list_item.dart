import 'package:flutter/material.dart';

class FeedListItem extends StatelessWidget {

  final List<Widget> stackChildren;
  final Widget header;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: Column(
        children: <Widget>[
          header
        ],
      ),
    );
  }

  FeedListItem({this.header, this.stackChildren});
}