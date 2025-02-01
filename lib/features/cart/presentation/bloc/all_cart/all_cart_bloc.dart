import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlijoan_apps/features/cart/domain/entities/cart_entity.dart';
import 'package:mlijoan_apps/features/cart/domain/usecases/get_all_cart.dart';

part 'all_cart_event.dart';
part 'all_cart_state.dart';

class AllCartBloc extends Bloc<AllCartEvent, AllCartState> {
  final GetAllCartUseCase _useCase;

  AllCartBloc(this._useCase) : super(AllCartInitial()) {
    on<OnGetAllCart>((event, emit) async{
      emit(AllCartLoading());
      final result = await _useCase.call();
      result.fold(
        (failure) => emit(AllCartFailure(message: failure.message)), 
        (data) => emit(AllCartLoaded(data: data)));
    });
  }
}
