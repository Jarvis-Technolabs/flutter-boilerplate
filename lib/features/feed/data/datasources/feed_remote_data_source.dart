import 'package:flutter_clean_architecture/features/feed/data/models/feeds_item.dart';

abstract class FeedRemoteDataSource {
  Future<List<InstitutionsItem>> getFeed();
}
