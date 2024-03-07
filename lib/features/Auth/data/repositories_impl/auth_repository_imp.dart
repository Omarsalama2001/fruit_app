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
  Future<Either<Failure, UserEntity>> login({required bool isGoogle}) async {
    try {
      UserModel userModel = await remoteDataSource.login(isGoogle: isGoogle);
      return Future.value(Right(userModel));
    } catch (exception) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(String email, String password) async {
    if (await networkInfo.isConnected) {
      try {
        UserModel userModel = await remoteDataSource.loginWithEmailAndPassword(email, password);
        return Future.value(Right(userModel));
      } on EmailNotVerifiedException {
        return Left(EmailNotVerifiedFailure());
      } on ServerException {
        return Left(ServerFailure());
      } on AuthException catch (error) {
        return Left(AuthFailure(errorCode: error.errorCode));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> sendEmailVerification() async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.sendEmailVerification());
      } on ServerException {
        return Left(ServerFailure());
      } on AuthException catch (error) {
        return Left(AuthFailure(errorCode: error.errorCode));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword({required String email}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.sendPasswordResetEmail(email: email));
      } on ServerException {
        return Left(ServerFailure());
      } on AuthException catch (error) {
        return Left(AuthFailure(errorCode: error.errorCode));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> saveAdditionalUserData({required String adress, required String phoneNumber, required String? fcmToken}) {
    try {
      remoteDataSource.saveAdditionalUserData(adress, phoneNumber, fcmToken!);
      return Future.value(const Right(unit));
    } catch (exception) {
      return Future.value(Left(ServerFailure()));
    }
  }
}
