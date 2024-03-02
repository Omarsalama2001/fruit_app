import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/exeptions.dart';

import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/core/network/network_info.dart';
import 'package:fruit_e_commerce/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:fruit_e_commerce/features/home/data/models/category_model.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/category.dart';
import 'package:fruit_e_commerce/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  NetworkInfo networkInfo;
  HomeRepositoryImpl({
    required this.homeRemoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Faliure, List<Category>>> getAllCategoreis() async {
    if(await networkInfo.isConnected){
      try {
        final List<CategoryModel> categories = await homeRemoteDataSource.getAllCategories();
      return Right(categories);
      }catch (exceptionName) {
        return  Left(ServerFaliure());
      }
    }
    else{
      return  Left(ConnectionFaliure());
    }
   
    
  }
}
