import 'package:coin_view/domain/models/coin.dart';

class CoinDTO {
  final String id;
  final bool isActive;
  final bool isNew;
  final String name;
  final int rank;
  final String symbol;
  final String type;

  CoinDTO({
    required this.id,
    required this.isActive,
    required this.isNew,
    required this.name,
    required this.rank,
    required this.symbol,
    required this.type,
  });

  factory CoinDTO.fromJson(Map<String, dynamic> json) {
    return CoinDTO(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      rank: json['rank'],
      isNew: json['is_new'],
      isActive: json['is_active'],
      type: json['type'],
    );
  }
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
