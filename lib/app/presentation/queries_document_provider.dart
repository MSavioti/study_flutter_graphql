import 'package:flutter/material.dart';
import 'package:study_flutter_graphql/app/data/pokedex_queries.dart';

class QueriesDocumentProvider extends InheritedWidget {
  const QueriesDocumentProvider({
    Key? key,
    required this.queries,
    required Widget child,
  }) : super(key: key, child: child);

  final PodekexQueries queries;

  static PodekexQueries of(BuildContext context) {
    final InheritedElement? element = context
        .getElementForInheritedWidgetOfExactType<QueriesDocumentProvider>();
    assert(element != null, 'No PokedexQueries found in context');
    return (element!.widget as QueriesDocumentProvider).queries;
  }

  @override
  bool updateShouldNotify(QueriesDocumentProvider oldWidget) {
    return queries != oldWidget.queries;
  }
}
