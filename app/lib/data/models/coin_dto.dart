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
