import 'package:dartz/dartz.dart';
import 'package:iranicart_crypto/data/datasource/cryptosinfo_datasource.dart';
import 'package:iranicart_crypto/data/model/CryptocurrencyMetrics.dart';
import 'package:iranicart_crypto/data/model/crypto.dart';
import 'package:iranicart_crypto/di/di.dart';
import 'package:iranicart_crypto/utils/api_exception.dart';

abstract class ICryptoRepository {
  Future<Either<String, List<crypto>>> fetch_all_crypto_info_repository();
  Future<Either<String, List<crypto>>>
      get_declining_cryptos_last_24h_repository();
  Future<Either<String, List<crypto>>>
      get_growing_cryptos_last_24h_repository();
  Future<Either<String, List<CryptocurrencyMetrics>>> fetchCryptoPricesInRLS();
}

class Cryptorepository extends ICryptoRepository {
  ICryotoInfoDataSource _datasource = locator.get();
  @override
  Future<Either<String, List<crypto>>>
      fetch_all_crypto_info_repository() async {
    try {
      var response = await _datasource.fetch_all_crypto_info_datasource();
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? "محتوای فنی نداری");
    } catch (e) {
      return left("محتوای فنی نداری");
    }
  }

  @override
  Future<Either<String, List<crypto>>>
      get_growing_cryptos_last_24h_repository() async {
    try {
      List<crypto> allcrypto =
          await _datasource.get_growing_cryptos_last_24h_datasource();
      return right(allcrypto);
    } on ApiException catch (e) {
      return left(e.message ?? "محتوای فنی نداری");
    }
  }

  @override
  Future<Either<String, List<crypto>>>
      get_declining_cryptos_last_24h_repository() async {
    try {
      List<crypto> allcrypto =
          await _datasource.get_declining_cryptos_last_24h_datasource();
      return right(allcrypto);
    } on ApiException catch (e) {
      return left(e.message ?? "محتوای فنی نداری");
    }
  }

  @override
  Future<Either<String, List<CryptocurrencyMetrics>>>
      fetchCryptoPricesInRLS() async {
    try {
      List<CryptocurrencyMetrics> top3coininrls =
          await _datasource.getUSDTInRLS();
      return right(top3coininrls);
    } on ApiException catch (e) {
      return left(e.message ?? "محتوای فنی نداری");
    }
  }
}
