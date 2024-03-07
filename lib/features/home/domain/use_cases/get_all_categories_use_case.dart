
import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import '../entities/category.dart';
import '../repositories/home_repository.dart';

class GetAllCategoriesUSeCase {
  HomeRepository homeRepository;
  GetAllCategoriesUSeCase({
    required this.homeRepository,
  });
  Future<Either<Failure, List<Category>>> call() {
    return homeRepository.getAllCategoreis();
  }
}
