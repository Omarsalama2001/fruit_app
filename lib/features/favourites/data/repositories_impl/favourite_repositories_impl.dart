import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/favourites/domain/repositories/favourites_repository.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/item_entity.dart';

class FavouriteRepositoryImpl implements FavouriteRepository {
  @override
  Future<Either<Unit, Faliure>> addItemToFavourites(String userID, String categoryID, String subCategoryID, String itemId) {
    // TODO: implement addItemToFavourites
    throw UnimplementedError();
  }

  @override
  Future<Either<Unit, Faliure>> deleteItemFromFavourites(String itemId) {
    // TODO: implement deleteItemFromFavourites
    throw UnimplementedError();
  }

  @override
  Future<Either<List<Item>, Faliure>> getFavouriteItems() {
    // TODO: implement getFavouriteItems
    throw UnimplementedError();
  }
}
