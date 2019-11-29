import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/database/AppDb.dart';
import 'package:flutter_clean_architecture/core/http/network_info.dart';
import 'package:flutter_clean_architecture/core/models/Success.dart';
import 'package:flutter_clean_architecture/core/models/error/failure.dart';
import 'package:flutter_clean_architecture/core/util/injection_container.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_local_data_source.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_remote_data_source.dart';
import 'package:flutter_clean_architecture/features/feed/data/models/feeds_item.dart';
import 'package:flutter_clean_architecture/features/feed/domain/repositories/feeds_repository.dart';

class FeedsRepositoryImpl implements FeedsRepository {
  FeedsRepositoryImpl(
      {@required this.remoteDataSource, @required this.networkInfo});

  final FeedRemoteDataSource remoteDataSource;
  FeedLocalDataSource localDataSource;

  final NetworkInfo networkInfo;

  @override
  Future<List<InstitutionsItem>> getFeeds() async {
    localDataSource = sl();
    List<InstitutionsItem> arrays = await localDataSource.getFeed();
    return arrays;
  }

  @override
  Future<Either<Failure, Success>> getApiStatus() async {
    localDataSource = sl();
    bool isConnected = await networkInfo.isConnected;
    if (!isConnected) {
      return Left(InternetConnection());
    }
    try {
      final feed = await remoteDataSource.getFeed();

      if (feed == null || feed is Failure) {
        return Left(Failure(message: 'Inner Error ', apiStatus: 0));
      } else {
        List<Institutions> instituteList = feed
            .map((item) => Institutions(
                  institutionId: item.InstitutionId,
                  institutionName: item.InstitutionName,
                ))
            .toList();
        localDataSource.insertInstitutions(instituteList);
        return Right(Success(message: "Data Inserted!!"));
      }
    } on DioError catch (e) {
      int statusCode = e.response.statusCode;
      return Left(Failure(message: e.toString(), apiStatus: statusCode));
    } catch (e) {
      return Left(Failure(message: e.toString(), apiStatus: 0));
    }
  }
}
