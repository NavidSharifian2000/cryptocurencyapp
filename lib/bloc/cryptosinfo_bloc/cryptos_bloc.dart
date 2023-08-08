import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:iranicart_crypto/bloc/cryptosinfo_bloc/cryptos_event.dart';
import 'package:iranicart_crypto/bloc/cryptosinfo_bloc/cryptos_state.dart';
import 'package:iranicart_crypto/data/model/crypto.dart';
import 'package:iranicart_crypto/data/repository/cryptoinfo_Repository.dart';
import 'package:iranicart_crypto/di/di.dart';

class CryptotBloc extends Bloc<CryptosEvent, CryptosState> {
  ICryptoRepository _repository = locator.get();
  CryptotBloc() : super(CryptosInitState()) {
    on<CryptogetdataEvent>(
      (event, emit) async {
        emit(CryptosLoadingState());
        var all_crypto_data =
            await _repository.fetch_all_crypto_info_repository();
        var declining_cryptos_last_24h =
            await _repository.get_declining_cryptos_last_24h_repository();
        var growing_cryptos_last_24h =
            await _repository.get_growing_cryptos_last_24h_repository();
        var cryptoPricesIRLS = await _repository.fetchCryptoPricesInRLS();
        emit(CryptossuccessState(all_crypto_data, growing_cryptos_last_24h,
            declining_cryptos_last_24h, cryptoPricesIRLS));
      },
    );
  }
}
