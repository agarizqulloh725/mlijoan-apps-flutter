import 'package:dartz/dartz.dart';
import 'package:mlijoan_apps/core/error/failures.dart';

import '../entities/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failures,List<CartEntity>>> all();
  Future<Either<Failures,List<CartEntity>>> update(int id);
  Future<Either<Failures, bool>> destroy(int id);
}