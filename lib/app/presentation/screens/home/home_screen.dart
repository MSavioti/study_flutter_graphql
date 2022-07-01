import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:study_flutter_graphql/app/data/pokedex_queries.dart';
import 'package:study_flutter_graphql/app/presentation/screens/home/widgets/search_text_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(children: [
        SearchTextField(controller: controller),
        const SizedBox(height: 16.0),
        Query(
          options: QueryOptions(
            document: gql(PodekexQueries.getPokemon),
            fetchPolicy: FetchPolicy.cacheAndNetwork,
          ),
          builder: (QueryResult result,
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }

            if (result.isLoading) {
              return const CircularProgressIndicator();
            }

            final pokemonData = result.data?['data'];

            return Container(
              child: Text(pokemonData),
            );
          },
        ),
      ]),
    );
  }
}
