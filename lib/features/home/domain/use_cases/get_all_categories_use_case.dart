import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/category.dart';

import 'package:fruit_e_commerce/features/home/domain/repositories/home_repository.dart';

class GetAllCategoriesUSeCase {
  HomeRepository homeRepository;
  GetAllCategoriesUSeCase({
    required this.homeRepository,
  });
  Future<Either<Faliure, List<Category>>> call() {
    return homeRepository.getAllCategoreis();
  }
}
