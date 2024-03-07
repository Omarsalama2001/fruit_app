import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/faliure.dart';
import 'package:fruit_e_commerce/features/favourites/domain/repositories/favourites_repository.dart';
import 'package:fruit_e_commerce/features/home/presentation/blocs/bloc/home_bloc.dart';

class DeleteItemsFromFavouritesUseCase {
  final FavouriteRepository favouriteRepository;
  DeleteItemsFromFavouritesUseCase({
    required this.favouriteRepository,
  });

  Future<Either<Unit, Failure>> call(String itemID) {
    return favouriteRepository.deleteItemFromFavourites(itemID);
  }
}
