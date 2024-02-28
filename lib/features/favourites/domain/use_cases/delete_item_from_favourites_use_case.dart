import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/favourites/domain/repositories/favourites_repository.dart';

class DeleteItemsFromFavouritesUseCase {
  final FavouriteRepository favouriteRepository;
  DeleteItemsFromFavouritesUseCase({
    required this.favouriteRepository,
  });

  Future<Either<Unit, Faliure>> call(String itemID) {
    return favouriteRepository.deleteItemFromFavourites(itemID);
  }
}
