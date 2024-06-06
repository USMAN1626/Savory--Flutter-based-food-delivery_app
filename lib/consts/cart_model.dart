import 'package:firebase_database/firebase_database.dart';

class CartFood {
  String id;
  String name;
  String imageUrl;
  String description;
  double price;
  int quantity;

  CartFood({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.quantity,
  });

  factory CartFood.fromJson(Map<String, dynamic> json) {
    return CartFood(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'price': price,
      'quantity': quantity,
    };
  }
}
