import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:layerx_technical_problem/common/utils/logger.dart';
import 'package:layerx_technical_problem/data/graphql_client/master_list_mock_link.dart';
import 'package:layerx_technical_problem/data/graphql_client/master_type_mock_link.dart';

GraphQLClient buildMockGraphQLClient() {
  final link = Link.split(
    (request) => request.operation.operationName == 'FetchAllMasters',
    masterListMockLink,
    Link.split(
      (request) => request.operation.operationName == 'FetchMasterTypes',
      masterTypeMockLink,
      Link.function((req, [fwd]) async* {
        AppLogger.debug('Unhandled operation: ${req.operation.operationName}');
        yield const Response(
          data: null,
          response: {'statusCode': 404},
          errors: [GraphQLError(message: 'Not handled')],
        );
      }),
    ),
  );

  return GraphQLClient(link: link, cache: GraphQLCache(store: InMemoryStore()));
}
