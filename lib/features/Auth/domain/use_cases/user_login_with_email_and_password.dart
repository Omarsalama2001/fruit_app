import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/Auth/domain/entities/user_entity.dart';
import 'package:fruit_e_commerce/features/Auth/domain/repositories/Auth_repository.dart';

class UserLoginWithEmailAndPasswordUseCase {
  AuthRepository authRepository;
  UserLoginWithEmailAndPasswordUseCase({
    required this.authRepository,
  });

  Future<Either<Faliure, UserEntity>> call(String email, String password) {
    return authRepository.loginWithEmailAndPassword(email, password);
  }
}
