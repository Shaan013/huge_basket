class ProductModel {
  final int id;
  final String name;
  final double price;
  final String weight;
  final String imageUrl;
  int quantity;

  ProductModel({
    this.id = 0,
    required this.name,
    required this.price,
    required this.weight,
    required this.imageUrl,
    this.quantity = 0,
  });
}