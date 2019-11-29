import 'dart:async';

import 'package:flutter_clean_architecture/core/http/http_client.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/feed/data/models/feeds_item.dart';
import 'package:flutter_clean_architecture/features/feed/data/models/instituteion_list.dart';

class FeedRemoteDataSourceImpl implements FeedRemoteDataSource {
  FeedRemoteDataSourceImpl({this.restClient});

  final RestClient restClient;

  @override
  Future<List<InstitutionsItem>> getFeed() async {
    final feed =
        await restClient.getClientWithHeaders(getHeaders()).getInstitutions();
    return InstitutionList(feed.data).institutes;
  }

  Map getHeaders() => <String, String>{
    "deviceid": "c6aafc97ea24c69c",
    "devicetoken": "e2ffa5c7-6f05-4fb0-9d87-c06e1bcad7fd",
    "authenticationtoken": "14da1368-6742-4c2f-a15d-48f6ac1b7d12"
      };
}
