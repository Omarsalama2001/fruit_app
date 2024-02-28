import 'package:equatable/equatable.dart';
import 'package:fruit_e_commerce/features/home/domain/entities/item_entity.dart';

class SubCategory extends Equatable {
  final String id;
  final String name;
  final String title;
  final double discount;
  final List<Item> items;

  const SubCategory({required this.id, required this.name, required this.title, required this.items, required this.discount});

  @override
  List<Object?> get props => [id, name, title, items];
}
