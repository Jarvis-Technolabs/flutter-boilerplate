import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/http/network_info.dart';
import 'package:flutter_clean_architecture/core/models/error/failure.dart';
import 'package:flutter_clean_architecture/features/login/data/datasources/login_source.dart';
import 'package:flutter_clean_architecture/features/login/data/entities/RegistrationRequest.dart';
import 'package:flutter_clean_architecture/features/login/domain/repository/UserRepository.dart';

class UserRepositoryIml extends UserRepository {
  UserRepositoryIml(
      {@required this.networkInfo, @required this.remoteLoginSource});

  LoginDataSource remoteLoginSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, String>> login(
      RegistrationRequest registrationRequestModel) async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      var data = remoteLoginSource.callLogin(registrationRequestModel);
      if (data == null) {
        return Left(Failure(message: "Data NUll!!"));
      }
      return Right("data found!!");
    } else {
      return Left(InternetConnection());
    }
  }
}
