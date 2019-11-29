import 'package:flutter_clean_architecture/core/database/AppDb.dart';
import 'package:flutter_clean_architecture/features/feed/data/models/feeds_item.dart';

abstract class FeedLocalDataSource {
  Future<List<InstitutionsItem>> getFeed();

  Future<void> insertInstitutions(List<Institutions> institutions);
}
