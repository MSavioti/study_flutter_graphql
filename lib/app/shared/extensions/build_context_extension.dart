import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:study_flutter_graphql/app/data/pokedex_queries.dart';
import 'package:study_flutter_graphql/app/presentation/queries_document_provider.dart';
import 'package:study_flutter_graphql/app/shared/models/error_model.dart';

extension BuildContextExtension on BuildContext {
  PodekexQueries get queries => QueriesDocumentProvider.of(this);

  GraphQLClient get graphQlClient => GraphQLProvider.of(this).value;

  void showError(ErrorModel error) {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final theme = Theme.of(this);

        ScaffoldMessenger.of(this).showMaterialBanner(
          MaterialBanner(
            backgroundColor: theme.colorScheme.primary,
            contentTextStyle:
                theme.textTheme.headline5!.copyWith(color: Colors.white),
            content: Text(error.error),
            actions: [
              InkWell(
                onTap: () => ScaffoldMessenger.of(this).clearMaterialBanners(),
                child: const Icon(Icons.close, color: Colors.white),
              )
            ],
          ),
        );
      },
    );
  }
}
