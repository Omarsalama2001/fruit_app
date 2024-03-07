import 'package:dartz/dartz.dart';

import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/Auth/domain/repositories/Auth_repository.dart';

class SendEmailVerificationUseCase {
  AuthRepository authRepository;
  SendEmailVerificationUseCase({
    required this.authRepository,
  });

  Future<Either<Failure, Unit>> call() {
    return authRepository.sendEmailVerification();
  }
}
