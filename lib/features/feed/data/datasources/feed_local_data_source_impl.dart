import 'dart:async';

import 'package:flutter_clean_architecture/core/database/AppDb.dart';
import 'package:flutter_clean_architecture/core/util/injection_container.dart';
import 'package:flutter_clean_architecture/features/feed/data/database/DbInstitutionsRepo.dart';
import 'package:flutter_clean_architecture/features/feed/data/models/feeds_item.dart';

import 'feed_local_data_source.dart';

class FeedLocalDataSourceImpl implements FeedLocalDataSource {
  FeedLocalDataSourceImpl();

  @override
  Future<List<InstitutionsItem>> getFeed() async {
    InstitutionRepo institutionRepo = sl();

    List<Institutions> institutions =
    await institutionRepo.selectInstitutions();
    List<InstitutionsItem> convertedArray = institutions.map((model) =>
        InstitutionsItem(
            InstitutionId: model.institutionId,
            InstitutionName: model.institutionName)).toList();

    return convertedArray;
  }

  @override
  Future<void> insertInstitutions(List<Institutions> institutions) {
    InstitutionRepo institutionRepo = sl();

    return institutionRepo.updateFreshInstitutions(institutions);
  }
}
