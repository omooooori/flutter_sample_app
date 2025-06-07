import 'package:graphql_flutter/graphql_flutter.dart';

const _graphqlEndpoint = 'http://localhost:8080/query';

GraphQLClient buildGraphQLClient() {
  final httpLink = HttpLink(_graphqlEndpoint);

  final cache = GraphQLCache(store: InMemoryStore());

  return GraphQLClient(
    link: httpLink,
    cache: cache,
    defaultPolicies: DefaultPolicies(
      query: Policies(fetch: FetchPolicy.networkOnly, error: ErrorPolicy.all),
      mutate: Policies(fetch: FetchPolicy.networkOnly, error: ErrorPolicy.all),
    ),
  );
}
