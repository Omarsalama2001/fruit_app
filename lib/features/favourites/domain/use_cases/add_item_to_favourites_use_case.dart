import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/favourites/domain/repositories/favourites_repository.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/item_entity.dart';


class AddItemToFavouritesUseCase {
  final FavouriteRepository favouriteRepository;
  AddItemToFavouritesUseCase({
    required this.favouriteRepository,
  });

  Future<Either<Failure,Unit>> call({required String userId,required Item item}) {
    return favouriteRepository.addItemToFavourites(userId, item);
  }
}
