class PodekexQueries {
  static String getPokemon(String pokemonName) {
    return """
    query getPokemon(pokemon: $pokemonName, reverseFlavorTexts: true, takeFlavorTexts: 1,) {
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
      dexNumber
      evolutionLevel
      evolutions
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
      preevolutions
      serebiiPage
      shinySprite
      species
      sprite
      types
      weight
    }
   """;
  }
}
