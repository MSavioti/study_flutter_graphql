class Abilities {
  final String first;
  final String? hidden;
  final String? second;
  final String? special;

  Abilities({
    required this.first,
    required this.hidden,
    required this.second,
    required this.special,
  });

  factory Abilities.fromJson(Map<String, dynamic> json) {
    return Abilities(
      first: json['first'],
      hidden: json['hidden'],
      second: json['second'],
      special: json['special'],
    );
  }
}
