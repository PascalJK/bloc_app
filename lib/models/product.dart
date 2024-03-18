import 'package:bloc_app/data/cart_items.dart';
import 'package:bloc_app/data/wishlist_items.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  String get getPriceString => 'N\$ $price';
  
  bool get isCarted {
    if (cartItems.isEmpty) return false;
    return cartItems.firstOrNull?.id == id;
  }

  bool get isWishlisted {
    if (wishlistItems.isEmpty) return false;
    return wishlistItems.firstOrNull?.id == id;
  }

  factory ProductModel.fromMap(map) {
    return ProductModel(
      id: map['id'].toString(),
      name: map['name'],
      description: map['description'],
      imageUrl: map['image_url'],
      price: map['price'],
    );
  }
}
