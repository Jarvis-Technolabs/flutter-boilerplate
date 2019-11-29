import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/apirepo/BaseApiRepo.dart';
import 'package:flutter_clean_architecture/core/models/Success.dart';
import 'package:flutter_clean_architecture/core/models/error/failure.dart';
import 'package:flutter_clean_architecture/features/feed/data/models/feeds_item.dart';

abstract class FeedsRepository extends BaseApiRepo {
  Future<List<InstitutionsItem>> getFeeds();
}
