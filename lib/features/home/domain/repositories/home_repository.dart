import 'package:dartz/dartz.dart';

import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/category.dart';

abstract class HomeRepository {
  Future<Either<Faliure, List<Category>>> getAllCategoreis();
}
