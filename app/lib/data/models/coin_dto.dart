import 'package:coin_view/domain/models/coin.dart';

class CoinDTO {
  CoinDTO({
    required this.id,
    required this.isActive,
    required this.isNew,
    required this.name,
    required this.rank,
    required this.symbol,
    required this.type,
  });

  final String id;
  final bool isActive;
  final bool isNew;
  final String name;
  final int rank;
  final String symbol;
  final String type;
}

extension Domain on CoinDTO {
  Coin toDomain({String? logo}) {
    return Coin(
      id: id,
      name: name,
      isActive: isActive,
      symbol: symbol,
      rank: rank,
      logoUrl: logo ?? "",
    );
  }
}
