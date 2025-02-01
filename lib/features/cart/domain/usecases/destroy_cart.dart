import 'package:dartz/dartz.dart';
import 'package:mlijoan_apps/core/error/failures.dart';
import 'package:mlijoan_apps/features/cart/domain/repositories/cart_repository.dart';


class DestroyCart {
  final CartRepository _repository;

  DestroyCart(this._repository);

  Future<Either<Failures, bool>> call(int id) async {
    return await _repository.destroy(id);
  }
}
