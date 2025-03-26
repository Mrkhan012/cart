class Product {
  final int id;
  final String title;
  final String brand;
  final double price;
  final double discountPercentage;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    required this.discountPercentage,
    required this.image,
  });

  double get discountedPrice => price - (price * (discountPercentage / 100));

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0, 
      title: json['title'] ?? 'No Title', 
      brand: json['brand'] ?? 'Unknown', 
      price: (json['price'] ?? 0).toDouble(),
      discountPercentage: (json['discountPercentage'] ?? 0).toDouble(), 
      image: json['thumbnail'] ?? 'https://example.com/default-image.jpg',
    );
  }
}
