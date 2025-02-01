import 'package:mlijoan_apps/features/cart/domain/entities/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.id,
    required super.productId, 
    required super.name, 
    required super.price, 
    required super.image, 
    required super.quantity,
  });

  // Factory method untuk membuat instance dari JSON.
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      productId: json['product_id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
    );
  }

  // Method untuk mengubah instance model menjadi JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'name': name,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }
  CartEntity toEntity() {
    return CartEntity(
      id: id,
      productId: productId,
      name: name,
      price: price,
      image: image,
      quantity: quantity,
    );
  }
}