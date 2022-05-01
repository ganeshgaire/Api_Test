class Product {
  String? productName;
  String? price;
  String? image;
  String? description;

  Product({this.productName, this.price, this.image, this.description});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      productName: json['product_name'],
      price: json['price'],
      image: json['image'],
      description: json['description']);
}
