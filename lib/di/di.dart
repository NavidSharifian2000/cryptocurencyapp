import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:iranicart_crypto/bloc/cryptosinfo_bloc/cryptos_bloc.dart';
import 'package:iranicart_crypto/data/datasource/cryptosinfo_datasource.dart';
import 'package:iranicart_crypto/data/repository/cryptoinfo_Repository.dart';

var locator = GetIt.instance;

Future<void> getInit() async {
  locator
    ..registerSingleton<Dio>(
        Dio(BaseOptions(baseUrl: "https://api.wallex.ir/v1/")),
        instanceName: "wallexapi");
  locator
    ..registerSingleton<Dio>(
        Dio(BaseOptions(baseUrl: "https://api.nobitex.ir/market/")),
        instanceName: "nobitexapi");
  locator
      .registerFactory<ICryotoInfoDataSource>(() => CryptoRemoteDataSource());
  locator.registerFactory<ICryptoRepository>(() => Cryptorepository());
  locator.registerSingleton<CryptotBloc>(CryptotBloc());
}
