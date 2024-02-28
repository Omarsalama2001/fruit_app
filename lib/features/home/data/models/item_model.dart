import 'package:json_annotation/json_annotation.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/item_entity.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel extends Item {
  const ItemModel({
    required String name,
    required String imageUrl,
    required double price,
    required double rating,
    required String description,
    required String id,
  }) : super(
          name: name,
          imageUrl: imageUrl,
          price: price,
          rating: rating,
          description: description,
          id: id,
        );

//*factory is used for creating logical objects
  factory ItemModel.fromJson(Map<String, dynamic> json, String id) => _$ItemModelFromJson(json,id);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
