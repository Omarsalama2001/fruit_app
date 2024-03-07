import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fruit_e_commerce/core/error/exeptions.dart';
import 'package:fruit_e_commerce/features/home/data/models/item_model.dart';

abstract class FavouriteRemoteDataSource {
  Future<Unit> addItemToFavourites(String userID, ItemModel item);
  Future<List<ItemModel>> getFavouriteItems(String userId);
  Future<Unit> deleteItemFromFavourites(String itemId);
}

class FavouriteRemoteDataSourceImpl extends FavouriteRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;
  FavouriteRemoteDataSourceImpl({
    required this.firebaseFirestore,
  });
  @override
  Future<Unit> addItemToFavourites(String userID, ItemModel item) async {
    try {
      await firebaseFirestore.collection("users-favourite-items").doc(userID).collection('items').doc(item.id).set(item.toJson());
      return unit;
    } catch (error) {
      throw ServerException();
    }
  }

  @override
  Future<List<ItemModel>> getFavouriteItems(String userId) async {
    throw UnimplementedError();
  }

  @override
  Future<Unit> deleteItemFromFavourites(String itemId) {
    // TODO: implement deleteItemFromFavourites
    throw UnimplementedError();
  }
}
