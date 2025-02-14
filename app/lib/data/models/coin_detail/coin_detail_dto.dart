import 'package:coin_view/data/models/models_dto.dart';
import 'package:coin_view/domain/models/coin_detail.dart';

final class CoinDetailDto {
  CoinDetailDto({
    required this.id,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.isNew,
    required this.isActive,
    required this.type,
    required this.contract,
    required this.logo,
    required this.platform,
    required this.description,
    required this.developmentStatus,
    required this.firstDataAt,
    required this.hardwareWallet,
    required this.hashAlgorithm,
    required this.lastDataAt,
    required this.message,
    required this.openSource,
    required this.orgStructure,
    required this.proofType,
    required this.startedAt,
    required this.tags,
    required this.team,
    required this.whitepaper,
  });

  final String id;
  final String name;
  final String symbol;
  final int rank;
  final bool isNew;
  final bool isActive;
  final String? type;
  final String? contract;
  final String? logo;
  final String? platform;
  final String? description;
  final String? developmentStatus;
  final String? firstDataAt;
  final bool hardwareWallet;
  final String? hashAlgorithm;
  final String? lastDataAt;
  final String? message;
  final bool openSource;
  final String? orgStructure;
  final String? proofType;
  final String? startedAt;
  final List<CoinTagDto> tags;
  final List<CoinTeamMemberDto> team;
  final CoinWhitepaperDto whitepaper;
}

extension on CoinDetailDto {
  CoinDetail toDomain() {
    return CoinDetail(
      id: this.id,
      name: this.name,
      symbol: this.symbol,
      rank: this.rank,
      isNew: this.isNew,
      isActive: this.isActive,
      descript: this.description ?? "",
      firstDataAt: this.firstDataAt ?? "",
      lastDataAt: this.lastDataAt ?? "",
      message: this.message ?? "",
      tags: this.tags.map((e) => e.name).join(", "),
      team: this.team.map((e) => "${e.name} - ${e.position}").join(", "),
      logoURL: this.logo ?? "",
    );
  }
}
