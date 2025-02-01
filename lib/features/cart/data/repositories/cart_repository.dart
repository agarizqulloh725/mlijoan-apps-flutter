import 'package:dartz/dartz.dart';
import 'package:mlijoan_apps/core/error/failures.dart';
import 'package:mlijoan_apps/core/platform/network_info.dart';
import 'package:mlijoan_apps/features/cart/data/datasource/cart_local_data_source.dart';
import 'package:mlijoan_apps/features/cart/data/datasource/cart_remote_data_source.dart';
import 'package:mlijoan_apps/features/cart/domain/entities/cart_entity.dart';
import 'package:mlijoan_apps/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final NetworkInfo networkInfo;
  final CartLocalDataSource localDataSource;
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl({
    required this.networkInfo,
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failures, List<CartEntity>>> all() async {
    bool online = await networkInfo.isConnected();
    if (online) {
      try {
        final remoteCarts = await remoteDataSource.all();
        await localDataSource.cacheAll(remoteCarts);
        return Right(remoteCarts);
      } catch (e) {
        return const Left(ServerFailure(message: ''));
      }
    } else {
      try {
        final localCarts = await localDataSource.getAll();
        return Right(localCarts);
      } catch (e) {
        return const Left(CachedFailure(message: 'failure'));
      }
    }
  }

  @override
  Future<Either<Failures, bool>> destroy(int id) async {
    bool online = await networkInfo.isConnected();
    if (online) {
      try {
        final result = await remoteDataSource.destroy(id);
        return Right(result);
      } catch (e) {
        return const Left(ServerFailure(message: ''));
      }
    } else {
      return const Left(NetworkFailure(message: ''));
    }
  }

  @override
  Future<Either<Failures, List<CartEntity>>> update(int id) async {
    bool online = await networkInfo.isConnected();
    if (online) {
      try {
        final updatedCarts = await remoteDataSource.update(id);
        localDataSource.cacheAll(updatedCarts);  // Optionally update cache
        return Right(updatedCarts);
      } catch (e) {
        return const Left(ServerFailure(message: ''));
      }
    } else {
      return const Left(NetworkFailure(message: ''));
    }
  }
}
