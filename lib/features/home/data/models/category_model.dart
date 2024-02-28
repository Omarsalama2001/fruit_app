import 'package:fruit_e_commerce/features/home/data/models/sub_category_model.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/category.dart';

@JsonSerializable()
class CategoryModel extends Category {
  const CategoryModel({
    required String id,
    required String name,
    required List<SubCategoryModel> subCategories,
  }) : super(id: id, name: name, subCategories: subCategories);

  factory CategoryModel.fromJson(String categoryId, Map<String, dynamic> json, List<SubCategoryModel> subCategoryList) {
    return CategoryModel(id: categoryId, name: json['name'] as String, subCategories: subCategoryList);
  }
  Map<String, dynamic> toJson(CategoryModel categoryModel) => <String, dynamic>{'id': categoryModel.id, 'name': categoryModel.name, 'subCategories': categoryModel.subCategories};
}
