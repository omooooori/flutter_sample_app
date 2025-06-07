import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/data/graphql_client/client.dart';
import 'package:layerx_technical_problem/data/graphql_client/mock_client.dart';

final useMockClientProvider = Provider<bool>((_) => true);

final graphQLClientProvider = Provider<GraphQLClient>((ref) {
  final useMock = ref.watch(useMockClientProvider);

  if (useMock) {
    return buildMockGraphQLClient();
  } else {
    return buildGraphQLClient();
  }
});
