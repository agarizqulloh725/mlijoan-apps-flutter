import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'destroy_cart_event.dart';
part 'destroy_cart_state.dart';

class DestroyCartBloc extends Bloc<DestroyCartEvent, DestroyCartState> {
  DestroyCartBloc() : super(DestroyCartInitial()) {
    on<DestroyCartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
