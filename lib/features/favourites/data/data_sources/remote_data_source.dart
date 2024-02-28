import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/home/data/models/item_model.dart';

abstract class FavouriteRemoteDataSource {
  Future<Either<List<ItemModel>, Faliure>> getFavouriteItems();
  Future<Either<Unit, Faliure>> deleteItemFromFavourites(String itemId);
  Future<Either<Unit, Faliure>> addItemToFavourites(String userID, String categoryID, String subCategoryID, String itemId);
}

class FavouriteRemoteDataSourceImpl extends FavouriteRemoteDataSource {
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
  Future<Either<List<ItemModel>, Faliure>> getFavouriteItems() {
    // TODO: implement getFavouriteItems
    throw UnimplementedError();
  }
}
