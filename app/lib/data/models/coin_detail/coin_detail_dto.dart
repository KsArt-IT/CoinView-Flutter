import 'package:coin_view/data/models/models_dto.dart';
import 'package:coin_view/domain/models/coin_detail.dart';

final class CoinDetailDto {
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

  factory CoinDetailDto.fromJson(Map<String, dynamic> json) {
    return CoinDetailDto(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      rank: json['rank'],
      isNew: json['is_new'],
      isActive: json['is_active'],
      type: json['type'],
      contract: json['contract'],
      logo: json['logo'],
      platform: json['platform'],
      description: json['description'],
      developmentStatus: json['development_status'],
      firstDataAt: json['first_data_at'],
      hardwareWallet: json['hardware_wallet'],
      hashAlgorithm: json['hash_algorithm'],
      lastDataAt: json['last_data_at'],
      message: json['message'],
      openSource: json['open_source'],
      orgStructure: json['org_structure'],
      proofType: json['proof_type'],
      startedAt: json['started_at'],
      tags: json['tags'].map((e) => CoinTagDto.fromJson(e)).toList(),
      team: json['team'].map((e) => CoinTeamMemberDto.fromJson(e)).toList(),
      whitepaper:
          json['whitepaper'].map((e) => CoinWhitepaperDto.fromJson(e)).toList(),
    );
  }
}

extension Domain on CoinDetailDto {
  CoinDetail toDomain() {
    return CoinDetail(
      id: id,
      name: name,
      symbol: symbol,
      rank: rank,
      isNew: isNew,
      isActive: isActive,
      descript: description ?? "",
      firstDataAt: firstDataAt ?? "",
      lastDataAt: lastDataAt ?? "",
      message: message ?? "",
      tags: tags.map((e) => e.name).join(", "),
      team: team.map((e) => "${e.name} - ${e.position}").join(", "),
      logoURL: logo ?? "",
    );
  }
}
