import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:study_flutter_graphql/app/data/pokedex_queries.dart';
import 'package:study_flutter_graphql/app/presentation/screens/home/widgets/search_text_field.dart';
import 'package:study_flutter_graphql/app/shared/models/pokemon.dart';

import 'package:study_flutter_graphql/app/shared/extensions/string_extension.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.searchTerm,
  }) : super(key: key);

  final controller = TextEditingController();
  final String? searchTerm;

  @override
  Widget build(BuildContext context) {
    void _search(String searchTerm) {
      Navigator.of(context).pushReplacementNamed(
        '/',
        arguments: searchTerm,
      );
    }

    if (searchTerm != null) {
      controller.text = searchTerm!;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: [
          SearchTextField(
            controller: controller,
            initialValue: controller.text,
            onSubmit: _search,
          ),
          const SizedBox(height: 16.0),
          if (searchTerm == null || searchTerm!.isEmpty)
            const Text('Search for a pokemon'),
          if (searchTerm != null && searchTerm!.isNotEmpty)
            Query(
              options: QueryOptions(
                document: gql(PodekexQueries.getPokemon),
                fetchPolicy: FetchPolicy.cacheAndNetwork,
                variables: {'pokemon': searchTerm},
              ),
              builder: (QueryResult result,
                  {VoidCallback? refetch, FetchMore? fetchMore}) {
                if (result.hasException) {
                  return Text(result.exception.toString());
                }

                if (result.isLoading) {
                  return const CircularProgressIndicator();
                }

                final pokemonData = result.data?['getPokemon'];

                if (pokemonData == null) {
                  return const Icon(Icons.error);
                }

                final pokemon = Pokemon.fromJson(pokemonData);

                return Center(
                  child: Container(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Image.network(pokemon.sprite),
                                const SizedBox(height: 12.0),
                                for (int i = 0; i < pokemon.types.length; i++)
                                  Text(pokemon.types[i]),
                              ],
                            ),
                            const SizedBox(width: 16.0),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${pokemon.dexNumber} - ${pokemon.name.toTitleCase()}',
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text('Weight: ${pokemon.weight}kg'),
                                Text('Height: ${pokemon.height}m'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        Text(pokemon.flavorTexts.first.flavor),
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
