import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/Auth/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:fruit_e_commerce/features/Auth/data/models/user_data_model.dart';
import 'package:fruit_e_commerce/features/Auth/domain/entities/user_entity.dart';
import 'package:fruit_e_commerce/features/Auth/domain/repositories/Auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  RemoteDataSource remoteDataSource;
  AuthRepositoryImpl({
    required this.remoteDataSource,
  });
  @override
  Future<Either<Faliure, User>> login({required bool isGoogle}) async {
    try {
      UserModel userModel = await remoteDataSource.loign(isGoogle: isGoogle);
      return Future.value(Right(userModel));
    } catch (exception) {
      return Left(ServerFaliure(exceptionName: exception.toString()));
    }
  }
}
