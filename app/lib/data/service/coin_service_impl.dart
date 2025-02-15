import 'package:coin_view/core/utils/result.dart';
import 'package:coin_view/data/models/models_dto.dart';
import 'package:coin_view/data/models/coin_dto.dart';
import 'package:coin_view/data/service/coin_service.dart';
import 'package:coin_view/data/service/coin_service_mock.dart';

final class CoinServiceImpl extends CoinService {
  @override
  Future<Result<List<CoinDTO>>> getCoins() async {
    return Result.success(CoinServiceMock.listCoins);
  }

  @override
  Future<Result<CoinDetailDto>> getCoinDetail(String id) async {
    final coinDetail = CoinServiceMock.listCoinsDetail.firstWhere((element) => element.id == id);
    if (coinDetail != null) {
      return Result.success(coinDetail);
    }
    return Result.failure(Exception("Coin detail not found"));
  }

}
