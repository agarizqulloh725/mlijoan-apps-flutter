import 'package:dartz/dartz.dart';
import 'package:mlijoan_apps/core/error/failures.dart';
import 'package:mlijoan_apps/features/cart/domain/entities/cart_entity.dart';
import 'package:mlijoan_apps/features/cart/domain/repositories/cart_repository.dart';

class GetAllCartUseCase {
  final CartRepository _repository;
  

  GetAllCartUseCase(this._repository);
  
  Future<Either<Failures, List<CartEntity>>> call() async {
    return await _repository.all();
  }
}
