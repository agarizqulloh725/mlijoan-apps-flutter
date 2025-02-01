part of 'all_cart_bloc.dart';

sealed class AllCartState extends Equatable {
  const AllCartState();
  
  @override
  List<Object> get props => [];
}

final class AllCartInitial extends AllCartState {}
final class AllCartLoading extends AllCartState {}
final class AllCartFailure extends AllCartState {
  final String message;

  const AllCartFailure({required this.message});

  @override
  List<Object> get props => [message];
}
final class AllCartLoaded extends AllCartState {
  final List<CartEntity> data;

  const AllCartLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

