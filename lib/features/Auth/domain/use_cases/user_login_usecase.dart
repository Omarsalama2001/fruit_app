import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/Auth/domain/entities/user_entity.dart';
import 'package:fruit_e_commerce/features/Auth/domain/repositories/Auth_repository.dart';

class UserLoginUseCase {
  final AuthRepository authRepository;

  UserLoginUseCase({required this.authRepository});
  Future<Either<Failure, UserEntity>> login({required bool isGoogle}) {
    return authRepository.login(isGoogle: isGoogle);
  }
}
