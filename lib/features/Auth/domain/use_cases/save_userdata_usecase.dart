import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/Auth/domain/repositories/Auth_repository.dart';

class SaveAdditionalUserdataUseCase {
  final AuthRepository authRepository;

  SaveAdditionalUserdataUseCase({required this.authRepository});

  Future<Either<Faliure, Unit>> call({required String adress, required String phoneNumber, required String? fcmToken}) {
    return authRepository.saveAdditionalUserData(adress:adress, phoneNumber: phoneNumber, fcmToken: fcmToken);
  }
}
