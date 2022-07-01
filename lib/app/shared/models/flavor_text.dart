class FlavorText {
  final String flavor;
  final String game;

  FlavorText({
    required this.flavor,
    required this.game,
  });

  factory FlavorText.fromJson(Map<String, dynamic> json) {
    return FlavorText(flavor: json['flavor'], game: json['game']);
  }
}
