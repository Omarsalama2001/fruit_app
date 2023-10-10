// ignore: file_names
import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/Auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Faliure, User>> login({required bool isGoogle});
}
