import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:study_flutter_graphql/app/data/pokedex_queries.dart';
import 'package:study_flutter_graphql/app/presentation/queries_document_provider.dart';
import 'package:study_flutter_graphql/app/presentation/screens/home/home_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GraphQLClient client = GraphQLClient(
    link: HttpLink('https://graphqlpokemon.favware.tech/'),
    cache: GraphQLCache(store: InMemoryStore()),
  );

  late final clientNotifier = ValueNotifier<GraphQLClient>(client);
  final queries = PodekexQueries();

  @override
  Widget build(BuildContext context) {
    return QueriesDocumentProvider(
      queries: queries,
      child: GraphQLProvider(
        client: clientNotifier,
        child: MaterialApp(
          title: 'GraphQL Pokedex',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
