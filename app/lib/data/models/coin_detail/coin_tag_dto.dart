final class CoinTagDto {
  final int coinCounter;
  final int icoCounter;
  final String id;
  final String name;

  CoinTagDto({
    required this.coinCounter,
    required this.icoCounter,
    required this.id,
    required this.name,
  });

  factory CoinTagDto.fromJson(Map<String, dynamic> json) {
    return CoinTagDto(
      coinCounter: json['coin_counter'],
      icoCounter: json['ico_counter'],
      id: json['id'],
      name: json['name'],
    );
  }
}
