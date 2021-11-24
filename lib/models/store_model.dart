class Product {
  int? id;
  String? title;
  String? price;
  String? description;
  String? category;
  String? image;

  Product(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'].toString(),
        description: json['description'],
        category: json['category'],
        image: json['image']);
  }
}
