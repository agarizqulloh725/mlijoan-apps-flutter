part of 'update_cart_bloc.dart';

sealed class UpdateCartEvent extends Equatable {
  const UpdateCartEvent();

  @override
  List<Object> get props => [];
}

class UpdateCart extends UpdateCartEvent {
  final int cartId;
  final int quantity;

  const UpdateCart({required this.cartId, required this.quantity});

  @override
  List<Object> get props => [cartId, quantity];
}
