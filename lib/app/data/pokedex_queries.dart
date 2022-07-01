class PodekexQueries {
  static String get getPokemon {
    return """
    query(\$pokemon: PokemonEnum!, \$reverseFlavorTexts: Boolean, \$takeFlavorTexts: Int) {
      getPokemon(pokemon: \$pokemon, reverseFlavorTexts: \$reverseFlavorTexts, takeFlavorTexts: \$takeFlavorTexts) {
        abilities {
          first
          second
          hidden
          special
        }
        baseStats {
          attack
          defense
          hp
          specialattack
          specialdefense
          speed
        }
        baseStatsTotal
        bulbapediaPage
        num
        evolutionLevel
        evYields {
          attack
          defense
          hp
          specialattack
          specialdefense
          speed
        }
        flavorTexts {
          game
          flavor
        }
        forme
        gender {
          female
          male
        }
        height
        isEggObtainable
        levellingRate
        maximumHatchTime
        minimumHatchTime
        serebiiPage
        shinySprite
        species
        sprite
        types
        weight
      }
    }
   """;
  }
}
