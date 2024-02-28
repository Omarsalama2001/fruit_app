import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double rating;
  final String description;
  const Item({required this.name, required this.imageUrl, required this.price, required this.rating, required this.description, required this.id});

  @override
  List<Object?> get props => [name, imageUrl, price, rating, description, id];
}
