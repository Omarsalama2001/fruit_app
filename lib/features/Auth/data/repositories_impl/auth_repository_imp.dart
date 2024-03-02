import 'package:dartz/dartz.dart';

import 'package:fruit_e_commerce/core/error/exeptions.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/core/network/network_info.dart';
import 'package:fruit_e_commerce/features/Auth/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:fruit_e_commerce/features/Auth/data/models/user_data_model.dart';
import 'package:fruit_e_commerce/features/Auth/domain/entities/user_entity.dart';
import 'package:fruit_e_commerce/features/Auth/domain/repositories/Auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  RemoteDataSource remoteDataSource;
  NetworkInfo networkInfo;
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Faliure, UserEntity>> login({required bool isGoogle}) async {
    try {
      UserModel userModel = await remoteDataSource.login(isGoogle: isGoogle);
      return Future.value(Right(userModel));
    } catch (exception) {
      return Left(ServerFaliure());
    }
  }

  @override
  Future<Either<Faliure, UserEntity>> loginWithEmailAndPassword(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = await remoteDataSource.loginWithEmailAndPassword(email, password);
        return Future.value(Right(userModel));
      } on EmailNotVerifiedException {
        return Left(EmailNotVerifiedFaliure());
      } on ServerException {
        return Left(ServerFaliure());
      }
    } else {
      return Left(ConnectionFaliure());
    }
  }

  @override
  Future<Either<Faliure, Unit>> saveAdditionalUserData({required String adress, required String phoneNumber, required String? fcmToken}) {
    try {
      remoteDataSource.saveAdditionalUserData(adress, phoneNumber, fcmToken!);
      return Future.value(const Right(unit));
    } catch (exception) {
      return Future.value(Left(ServerFaliure()));
    }
  }
}
