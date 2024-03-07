import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/exeptions.dart';

import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/core/network/network_info.dart';
import 'package:fruit_e_commerce/features/favourites/data/data_sources/remote_data_source.dart';
import 'package:fruit_e_commerce/features/favourites/domain/repositories/favourites_repository.dart';
import 'package:fruit_e_commerce/features/home/data/models/item_model.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/item_entity.dart';

class FavouriteRepositoryImpl implements FavouriteRepository {
 final  FavouriteRemoteDataSource favouriteRemoteDataSource;
  final  NetworkInfo networkInfo;
  const FavouriteRepositoryImpl({
    required this.favouriteRemoteDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, Unit>> addItemToFavourites(String userID, Item item) async {
    if (await networkInfo.isConnected) {
      try {
       final  ItemModel itemModel = ItemModel(id: item.id, name: item.name, description: item.description, imageUrl: item.imageUrl, rating: item.rating, price: item.price);
        favouriteRemoteDataSource.addItemToFavourites(userID, itemModel);
        return  const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  
  @override
  Future<Either<Failure,List<Item>>> getFavouriteItems(String userId) {
    // TODO: implement getFavouriteItems
    throw UnimplementedError();
  }

  @override
  Future<Either<Unit, Failure>> deleteItemFromFavourites(String itemId) {
    // TODO: implement deleteItemFromFavourites
    throw UnimplementedError();
  }

}
