import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/feed/data/models/feeds_item.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/widgets/feed_description.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/widgets/feed_list_item.dart';

class FeedList extends StatelessWidget {
  List<InstitutionsItem> feeds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        final feed = feeds[index];
        return FeedListItem(
            header: FeedDescription(description: feed.InstitutionName));
      },
      itemCount: feeds.length,
    );
  }

  FeedList({this.feeds});
}
