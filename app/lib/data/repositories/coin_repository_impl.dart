import 'package:coin_view/core/utils/result.dart';
import 'package:coin_view/data/models/coin_detail/coin_detail_dto.dart';
import 'package:coin_view/data/models/coin_dto.dart';
import 'package:coin_view/data/models/models_dto.dart';
import 'package:coin_view/data/service/coin_service.dart';
import 'package:coin_view/domain/models/coin.dart';
import 'package:coin_view/domain/models/coin_detail.dart';
import 'package:coin_view/domain/repositories/coin_repository.dart';

final class CoinRepositoryImpl implements CoinRepository {
  CoinRepositoryImpl({required this.service});

  final CoinService? service;

  @override
  Future<Result<List<Coin>>> fetchCoins() async {
    if (service == null) {
      return Result.failure(Exception("Service is null"));
    }
    final result = await service!.getCoins();
    switch (result) {
      case Success(value: final data):
        final coins = await Future.wait(
          data.map((CoinDTO coinDTO) async {
            final coinDetail = await service!.getCoinDetail(coinDTO.id);
            final logo = switch (coinDetail) {
              Success(value: final data) => data.logo,
              Failure() => null,
            };
            return coinDTO.toDomain(logo: logo);
          }),
        );
        return Result.success(coins);
      case Failure(:final error):
        return Result.failure(error);
    }
  }

  @override
  Future<Result<CoinDetail>> fetchCoinDetail(String id) async {
    final result = await service!.getCoinDetail(id);
    switch (result) {
      case Success(value: final data):
        return Result.success(data.toDomain());
      case Failure(:final error):
        return Result.failure(error);
    }
  }
}
