final class CoinTeamMemberDto {
  final String id;
  final String name;
  final String position;

  CoinTeamMemberDto({
    required this.id,
    required this.name,
    required this.position,
  });

  factory CoinTeamMemberDto.fromJson(Map<String, dynamic> json) {
    return CoinTeamMemberDto(
      id: json['id'],
      name: json['name'],
      position: json['position'],
    );
  }
}
