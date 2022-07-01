class PodekexQueries {
  static String get getPokemon {
    return """
    query {
      allArtists {
            id
            name
            imageUrl
            description
        }
    }
   """;
  }
}
