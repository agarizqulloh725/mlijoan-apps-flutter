part of 'update_cart_bloc.dart';

sealed class UpdateCartState extends Equatable {
  const UpdateCartState();
  
  @override
  List<Object> get props => [];
}

final class UpdateCartInitial extends UpdateCartState {}

class UpdateCartLoading extends UpdateCartState {}

class UpdateCartUpdated extends UpdateCartState {
  final List<CartEntity> carts;

  const UpdateCartUpdated({required this.carts});


  @override
  List<Object> get props => [carts];
}

class UpdateCartError extends UpdateCartState {
  final String message;

  const UpdateCartError({required this.message});


  @override
  List<Object> get props => [message];
}
