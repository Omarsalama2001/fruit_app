import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_e_commerce/core/error/exeptions.dart';

import 'package:fruit_e_commerce/features/home/data/models/category_model.dart';
import 'package:fruit_e_commerce/features/home/data/models/item_model.dart';
import 'package:fruit_e_commerce/features/home/data/models/sub_category_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<CategoryModel>> getAllCategories();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  FirebaseFirestore firestore;
  HomeRemoteDataSourceImpl({
    required this.firestore,
  });

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    List<CategoryModel> categories = [];
    CollectionReference<Map<String, dynamic>> collectionReference = firestore.collection('category');
    try {
      QuerySnapshot categorySnapShot = await collectionReference.get();

      for (QueryDocumentSnapshot categoryDoc in categorySnapShot.docs) {
        var subcategoriesSnapshot = await categoryDoc.reference.collection('sub_category').get();
        var subCategoryModels = <SubCategoryModel>[];

        // Inside the loop where you process items
        for (QueryDocumentSnapshot subcategoryDoc in subcategoriesSnapshot.docs) {
          var itemsSnapshot = await subcategoryDoc.reference.collection('item').get();
          var itemsList = itemsSnapshot.docs.map((e) => ItemModel.fromJson(e.data(), itemsSnapshot.docs.first.id)).toList();
          var subCategoryModel = SubCategoryModel.fromJson(subcategoryDoc.id, subcategoryDoc.data() as Map<String, dynamic>, itemsList);
          subCategoryModels.add(subCategoryModel);
        }

        var categoryModel = CategoryModel.fromJson(categoryDoc.id, categoryDoc.data() as Map<String, dynamic>, subCategoryModels);
        categories.add(categoryModel);
      }
      return categories;
    } catch (error) {
      throw ServerException(exceptionName: error.toString());
    }
  }
}
