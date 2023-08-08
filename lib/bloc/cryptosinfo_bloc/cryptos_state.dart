import 'package:dartz/dartz.dart';
import 'package:iranicart_crypto/data/model/CryptocurrencyMetrics.dart';
import 'package:iranicart_crypto/data/model/crypto.dart';

abstract class CryptosState {}

class CryptosInitState extends CryptosState {}

class CryptosLoadingState extends CryptosState {}

class CryptossuccessState extends CryptosState {
  Either<String, List<crypto>> cryptos;
  Either<String, List<crypto>> pluscryptos;
  Either<String, List<crypto>> minescryptos;
  Either<String, List<CryptocurrencyMetrics>> cryptoPricesIRLS;
  CryptossuccessState(
      this.cryptos, this.pluscryptos, this.minescryptos, this.cryptoPricesIRLS);
}
