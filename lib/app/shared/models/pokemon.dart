import 'package:study_flutter_graphql/app/shared/models/abilities.dart';
import 'package:study_flutter_graphql/app/shared/models/flavor_text.dart';
import 'package:study_flutter_graphql/app/shared/models/gender.dart';
import 'package:study_flutter_graphql/app/shared/models/stats.dart';

class Pokemon {
  final Abilities abilities;
  final Stats baseStats;
  final int baseStatsTotal;
  final String bulbapediaPage;
  final int dexNumber;
  final String? evolutionLevel;
  final List<Pokemon> evolutions;
  final Stats evYields;
  final List<FlavorText> flavorTexts;
  final String? forme;
  final Gender gender;
  final double height;
  final bool isEggObtainable;
  final String? levellingRate;
  final int? maximumHatchTime;
  final int? minimumHatchTime;
  final List<Pokemon>? preevolutions;
  final String serebiiPage;
  final String shinySprite;
  final String species;
  final String sprite;
  final List<String> types;
  final double weight;

  Pokemon({
    required this.abilities,
    required this.baseStats,
    required this.baseStatsTotal,
    required this.bulbapediaPage,
    required this.dexNumber,
    required this.evolutionLevel,
    required this.evolutions,
    required this.evYields,
    required this.flavorTexts,
    required this.forme,
    required this.gender,
    required this.height,
    required this.isEggObtainable,
    required this.levellingRate,
    required this.maximumHatchTime,
    required this.minimumHatchTime,
    required this.preevolutions,
    required this.serebiiPage,
    required this.shinySprite,
    required this.species,
    required this.sprite,
    required this.types,
    required this.weight,
  });

  String get name => species;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    List<FlavorText> flavorTexts = [];

    if (json['flavorTexts'] != null) {
      final List flavorItems = json['flavorTexts'] as List;
      flavorTexts = flavorItems.map((e) => FlavorText.fromJson(e)).toList();
    }

    List<Pokemon> preevolutions = [];

    if (json['preevolutions'] != null) {
      final List preevolItems = json['preevolutions'] as List;
      preevolutions = preevolItems.map((e) => Pokemon.fromJson(e)).toList();
    }

    List<Pokemon> evolutions = [];

    if (json['evolutions'] != null) {
      final List evolutionItems = json['evolutions'] as List;
      evolutions = evolutionItems.map((e) => Pokemon.fromJson(e)).toList();
    }

    return Pokemon(
      abilities: Abilities.fromJson(json['abilities']),
      baseStats: Stats.fromJson(json['baseStats']),
      baseStatsTotal: json['baseStatsTotal'],
      bulbapediaPage: json['bulbapediaPage'],
      dexNumber: json['num'],
      evolutionLevel: json['evolutionLevel'],
      evolutions: evolutions,
      evYields: Stats.fromJson(json['evYields']),
      flavorTexts: flavorTexts,
      forme: json['forme'],
      gender: Gender.fromJson(json['gender']),
      height: json['height'],
      isEggObtainable: json['isEggObtainable'],
      levellingRate: json['levellingRate'],
      maximumHatchTime: json['maximumHatchTime'],
      minimumHatchTime: json['minimumHatchTime'],
      preevolutions: preevolutions,
      serebiiPage: json['serebiiPage'],
      shinySprite: json['shinySprite'],
      species: json['species'],
      sprite: json['sprite'],
      types: json['types'].cast<String>(),
      weight: json['weight'],
    );
  }
}
