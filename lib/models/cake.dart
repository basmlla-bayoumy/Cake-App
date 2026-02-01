class Cake {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String category;
  final String description;
  final double rating;
  int quantity;

  Cake({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.description,
    required this.rating,
     required this.quantity,
  });

  factory Cake.fromJson(Map<String, dynamic> json) {
    return Cake(
      id: json['id'].toString(),
      title: json['title'],
      description: json['description'] ?? "Delicious cake",
      price: double.tryParse(json['price'].toString()) ?? 0,
      imageUrl: json['image'],
      category: json['category'],
      rating: double.tryParse(json['rating']?.toString() ?? "4.5") ?? 4.5,
      quantity: 1,
    );
  }

  

  
}
