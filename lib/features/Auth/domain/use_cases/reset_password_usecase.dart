import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';

import 'package:fruit_e_commerce/features/Auth/domain/repositories/Auth_repository.dart';

class ResetPasswordUseCase {
  AuthRepository authRepository;
  ResetPasswordUseCase({
    required this.authRepository,
  });
  Future<Either<Failure, Unit>> call({required String email}) async {
    return await authRepository.resetPassword(email: email);
  }
}
