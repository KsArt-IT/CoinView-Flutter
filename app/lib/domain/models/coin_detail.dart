final class CoinDetail {
    CoinDetail({
    required this.id,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.isNew,
    required this.isActive,
    required this.descript,
    required this.firstDataAt,
    required this.lastDataAt,
    required this.message,
    required this.tags,
    required this.team,
    required this.logoURL,
  });

  final String id;
  final String name;
  final String symbol;
  final int rank;
  final bool isNew;
  final bool isActive;
  final String descript;
  final String firstDataAt;
  final String lastDataAt;
  final String message;
  final String tags;
  final String team;
  final String logoURL;
}
