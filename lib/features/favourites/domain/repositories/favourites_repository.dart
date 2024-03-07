import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/item_entity.dart';


abstract class FavouriteRepository {
  Future<Either<Failure, Unit>> addItemToFavourites(String userID,Item item);
  Future<Either<Failure, List<Item>>> getFavouriteItems(String userId);
  Future<Either<Unit, Failure>> deleteItemFromFavourites(String itemId);
  
}
