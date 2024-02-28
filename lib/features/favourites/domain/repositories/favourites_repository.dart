import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/item_entity.dart';

abstract class FavouriteRepository {
  Future<Either<Unit, Faliure>> addItemToFavourites(String userID, String categoryID, String subCategoryID, String itemId);
  Future<Either<Unit, Faliure>> deleteItemFromFavourites(String itemId);
  Future<Either<List<Item>, Faliure>> getFavouriteItems();
}
