part of 'all_cart_bloc.dart';

sealed class AllCartEvent extends Equatable {
  const AllCartEvent();

  @override
  List<Object> get props => [];
}

class OnGetAllCart extends AllCartEvent{
  
}
