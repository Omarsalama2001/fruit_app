// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/Auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login({required bool isGoogle});
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(String email, String password);
  Future<Either<Failure, Unit>> sendEmailVerification();
  Future<Either<Failure, Unit>> resetPassword({required String email});

  Future<Either<Failure, Unit>> saveAdditionalUserData({required String adress, required String phoneNumber, required String? fcmToken});
}
