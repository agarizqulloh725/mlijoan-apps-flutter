import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:mlijoan_apps/core/platform/network_info.dart';
import 'package:mlijoan_apps/features/cart/data/datasource/cart_local_data_source.dart';
import 'package:mlijoan_apps/features/cart/data/datasource/cart_remote_data_source.dart';
import 'package:mlijoan_apps/features/cart/data/repositories/cart_repository.dart';
import 'package:mlijoan_apps/features/cart/domain/repositories/cart_repository.dart';
import 'package:mlijoan_apps/features/cart/domain/usecases/get_all_cart.dart';
import 'package:mlijoan_apps/features/cart/presentation/bloc/all_cart/all_cart_bloc.dart';

final locator = GetIt.instance;

Future<void> initLocator() async{
  locator.registerFactory(() => AllCartBloc(locator()));

  locator.registerLazySingleton(() => GetAllCartUseCase(locator()));

  locator.registerLazySingleton<CartRepository>(() => CartRepositoryImpl(
    networkInfo: locator(), 
    localDataSource: locator(), 
    remoteDataSource: locator())
    );

    locator.registerLazySingleton<CartLocalDataSource>(
      () => CartLocalDataSourceImpl(),
    );

    locator.registerLazySingleton<CartRemoteDataSource>(
        () => CartRemoteDataSourceImpl(locator(),locator()),
    );

    locator.registerLazySingleton<NetworkInfoImpl>(
      () => NetworkInfoImpl(locator()),
    );

    locator.registerLazySingleton(() => http.Client());
    locator.registerLazySingleton(() => Connectivity());

    
}