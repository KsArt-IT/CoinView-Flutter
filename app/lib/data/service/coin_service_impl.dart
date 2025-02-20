import 'package:coin_view/core/utils/result.dart';
import 'package:coin_view/data/models/coin_dto.dart';
import 'package:coin_view/data/models/models_dto.dart';
import 'package:coin_view/data/service/coin_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

final class CoinServiceImpl extends CoinService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.coinpaprika.com/v1"));

  @override
  Future<Result<List<CoinDTO>>> fetchCoins() async {
    try {
      final response = await _dio.get("/coins");
      if (response.statusCode == 200) {
        final coins = (response.data as List)
            .map((json) => CoinDTO.fromJson(json))
            .toList();
        return Result.success(coins);
      }
      return _getErrorByStatusCode(response.statusCode ?? -1);
    } catch (e) {
      return Result.failure(Exception(e));
    }
  }

  @override
  Future<Result<CoinDetailDto>> fetchCoinDetail(String id) async {
    debugPrint("CoinServiceImpl:fetchCoinDetail: $id");
    try {
      final response = await _dio.get("/coins/$id");
      if (response.statusCode == 200) {
        final coinDetail = CoinDetailDto.fromJson(response.data);
        return Result.success(coinDetail);
      }
      return _getErrorByStatusCode(response.statusCode ?? -1);
    } catch (e) {
      debugPrint("CoinServiceImpl:fetchCoinDetail: $id, error: ${e.toString()}");
      return Result.failure(Exception(e));
    }
  }

  Result<T> _getErrorByStatusCode<T>(int code) {
    return Result.failure(Exception("Error status code: $code"));
  }
}
