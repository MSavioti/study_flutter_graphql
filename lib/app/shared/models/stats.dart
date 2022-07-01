class Stats {
  final int attack;
  final int defense;
  final int hp;
  final int specialattack;
  final int specialdefense;
  final int speed;

  Stats({
    required this.attack,
    required this.defense,
    required this.hp,
    required this.specialattack,
    required this.specialdefense,
    required this.speed,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      attack: json['attack'],
      defense: json['defense'],
      hp: json['hp'],
      specialattack: json['specialattack'],
      specialdefense: json['specialdefense'],
      speed: json['speed'],
    );
  }
}
