import 'package:coin_view/core/utils/result.dart';
import 'package:coin_view/data/models/coin_dto.dart';
import 'package:coin_view/data/models/models_dto.dart';

abstract class CoinService {
  Future<Result<List<CoinDTO>>> fetchCoins();
  Future<Result<CoinDetailDto>> fetchCoinDetail(String id);
}
