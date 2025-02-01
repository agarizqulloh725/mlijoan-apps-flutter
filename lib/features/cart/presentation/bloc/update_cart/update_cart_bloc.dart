import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mlijoan_apps/features/cart/domain/entities/cart_entity.dart';

part 'update_cart_event.dart';
part 'update_cart_state.dart';

class UpdateCartBloc extends Bloc<UpdateCartEvent, UpdateCartState> {
  UpdateCartBloc() : super(UpdateCartInitial()) {
    on<UpdateCartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
