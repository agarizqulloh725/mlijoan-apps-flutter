import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final int id;
  final int productId;
  final String name;
  final int price;
  final String image;
  final int quantity;
  final String? options; 

  const CartEntity({
    required this.id,
    required this.productId,
    required this.name,
    required this.price,
    required this.image, 
    required this.quantity,
    this.options,  
  });

  @override
  List<Object?> get props { 
    return [
      id,
      productId,
      name,
      price,
      image,
      quantity,
      options,
    ];
  }
}
