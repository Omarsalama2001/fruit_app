import 'package:fruit_e_commerce/features/home/data/models/item_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/sub_category_entity.dart';

@JsonSerializable()
class SubCategoryModel extends SubCategory {
  const SubCategoryModel({
    required String id,
    required String name,
    required String title,
    required List<ItemModel> items,
    required double discount,
  }) : super(
          id: id,
          name: name,
          title: title,
          items: items,
          discount: discount,
        );

  factory SubCategoryModel.fromJson(String subCategoryId, Map<String, dynamic> json, List<ItemModel> items) {
    return SubCategoryModel(
      id: subCategoryId,
      name: json['name'] as String,
      title: json['title'] as String,
      items: items ,
      discount: (json['discount'] as num).toDouble(),
    );
  }
  Map<String, dynamic> toJson(SubCategoryModel subCategoryModel) => <String, dynamic>{'id': subCategoryModel.id, 'name': subCategoryModel.name, 'title': subCategoryModel.title, 'discount': subCategoryModel.discount, 'items': subCategoryModel.items};
}
