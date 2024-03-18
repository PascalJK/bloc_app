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

  factory ProductModel.fromMap(map) {
    return ProductModel(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      imageUrl: map['image_url'],
      price: map['price']
    );
  }
}
