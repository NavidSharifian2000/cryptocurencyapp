import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:iranicart_crypto/data/model/CryptocurrencyMetrics.dart';
import 'package:iranicart_crypto/data/model/crypto.dart';
import 'package:iranicart_crypto/di/di.dart';
import 'package:iranicart_crypto/utils/api_exception.dart';

abstract class ICryotoInfoDataSource {
  Future<List<crypto>> fetch_all_crypto_info_datasource();
  Future<List<crypto>> get_growing_cryptos_last_24h_datasource();
  Future<List<crypto>> get_declining_cryptos_last_24h_datasource();
  Future<List<CryptocurrencyMetrics>> getUSDTInRLS();
}

class CryptoRemoteDataSource extends ICryotoInfoDataSource {
  final Dio _wdio = locator.get<Dio>(instanceName: "wallexapi");
  final Dio _ndio = locator.get(instanceName: "nobitexapi");
  @override
  Future<List<crypto>> fetch_all_crypto_info_datasource() async {
    try {
      var response = await _wdio.get("/currencies/stats");
      return response.data["result"]
          .map<crypto>((jsonobject) => crypto.fromjson(jsonobject))
          .toList();
    } on DioException catch (e) {
      throw ApiException(e.response?.statusCode, e.response?.data["message"]);
    }
  }

  @override
  Future<List<crypto>> get_growing_cryptos_last_24h_datasource() async {
    try {
      var response = await _wdio.get("/currencies/stats");
      List<crypto> allcryptos = response.data["result"]
          .map<crypto>((jsonobject) => crypto.fromjson(jsonobject))
          .toList();
      return allcryptos
          .where((element) => element.percent_change_24h > 0)
          .toList();
    } on SocketException catch (e) {
      throw ApiException(401, "not net");
    } on DioException catch (e) {
      throw ApiException(e.response?.statusCode, e.response?.data["message"]);
    } catch (e) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<List<crypto>> get_declining_cryptos_last_24h_datasource() async {
    try {
      var response = await _wdio.get("/currencies/stats");
      List<crypto> allcryptos = response.data["result"]
          .map<crypto>((jsonobject) => crypto.fromjson(jsonobject))
          .toList();
      return allcryptos
          .where((element) => element.percent_change_24h < 0)
          .toList();
    } on SocketException catch (e) {
      throw ApiException(401, "not net");
    } on DioException catch (e) {
      throw ApiException(e.response?.statusCode, e.response?.data["message"]);
    } catch (e) {
      throw ApiException(0, 'unknown error');
    }
  }

  @override
  Future<List<CryptocurrencyMetrics>> getUSDTInRLS() async {
    try {
      List<Map<String, dynamic>> listOfmapofcryptos = [];
      List<String> listitems = ["btc", "usdt", "eth"];

      for (var element in listitems) {
        var response = await _ndio
            .get("/stats?srcCurrency=" + element + "&dstCurrency=rls");
        response.data["stats"][element + "-rls"]["name"] = element;
        listOfmapofcryptos.add(response.data["stats"][element + "-rls"]);
      }
      List<CryptocurrencyMetrics> listofinstances = await listOfmapofcryptos
          .map<CryptocurrencyMetrics>((json) => CryptocurrencyMetrics(
              json["latest"], json["dayChange"], json["name"]))
          .toList();
      return listofinstances;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
