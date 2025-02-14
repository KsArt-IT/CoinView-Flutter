import 'package:coin_view/core/utils/result.dart';
import 'package:coin_view/domain/models/coin.dart';
import 'package:coin_view/domain/models/coin_detail.dart';

abstract interface class CoinRepository {
  Future<Result<List<Coin>>> fetchCoins();
  Future<Result<CoinDetail>> fetchCoinDetail(String id);
}
