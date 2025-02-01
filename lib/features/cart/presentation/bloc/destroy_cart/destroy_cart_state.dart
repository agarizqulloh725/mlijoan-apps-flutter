part of 'destroy_cart_bloc.dart';

sealed class DestroyCartState extends Equatable {
  const DestroyCartState();
  
  @override
  List<Object> get props => [];
}

final class DestroyCartInitial extends DestroyCartState {}
