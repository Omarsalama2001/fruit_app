// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/Auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Faliure, UserEntity>> login({required bool isGoogle});
  Future<Either<Faliure, Unit>> saveAdditionalUserData({required String adress, required String phoneNumber, required String? fcmToken});
}
