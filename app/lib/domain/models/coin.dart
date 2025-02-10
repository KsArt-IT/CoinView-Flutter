class Coin {
  Coin({
    required this.id,
    required this.name,
    required this.isActive,
    required this.symbol,
    required this.rank,
    required this.logoUrl,
  });

  final String id;
  final String name;
  final bool isActive;
  final String symbol;
  final int rank;
  final String logoUrl;
}
