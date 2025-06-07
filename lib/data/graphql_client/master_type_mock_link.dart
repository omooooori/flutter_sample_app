import 'package:graphql_flutter/graphql_flutter.dart';

Link get masterTypeMockLink => Link.function((request, [forward]) async* {
      yield const Response(
        data: {
          '__typename': 'Query',
          'master_type_list': [
            {'id': 'department', 'label': '部門', '__typename': 'MasterType'},
            {'id': 'item', 'label': '品目', '__typename': 'MasterType'},
            {'id': 'project1', 'label': 'プロジェクト', '__typename': 'MasterType'},
            {'id': 'segment1', 'label': 'セグメント', '__typename': 'MasterType'},
            {'id': 'test', 'label': 'テストデータ', '__typename': 'MasterType'},
            {'id': 'bigData', 'label': '大量データ', '__typename': 'MasterType'},
          ],
        },
        response: {'statusCode': 200},
        errors: [],
        context: Context(),
      );
    });
