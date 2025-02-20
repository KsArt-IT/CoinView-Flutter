final class CoinWhitepaperDto {
  final String? link;
  final String? thumbnail;

  CoinWhitepaperDto({
    required this.link,
    required this.thumbnail,
  });

  factory CoinWhitepaperDto.fromJson(Map<String, dynamic> json) {
    return CoinWhitepaperDto(
      link: json['link'],
      thumbnail: json['thumbnail'],
    );
  }
}
