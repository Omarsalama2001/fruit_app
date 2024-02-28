import 'package:equatable/equatable.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/sub_category_entity.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final List<SubCategory> subCategories;
  const Category({
    required this.id,
    required this.name,
    required this.subCategories,
  });

  @override
  List<Object?> get props => [id, name, subCategories];
}
