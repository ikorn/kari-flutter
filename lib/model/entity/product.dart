class Product {
  final String id;
  final String name;
  final String description;
  final String brand;
  final List<String> categories;
  final List<String> keywords;
  final DateTime addedAt;
  final DateTime? updatedAt;
  final bool isActive;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.brand,
    required this.categories,
    required this.keywords,
    required this.addedAt,
    this.updatedAt,
    required this.isActive
  });
}