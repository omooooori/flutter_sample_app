import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/data/repository/master_search_repository.dart';
import 'package:layerx_technical_problem/data/repository/master_type_repository.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';
import 'package:layerx_technical_problem/domain/models/master_type.dart';
import 'package:layerx_technical_problem/presentation/pages/master_selection/provider/master_selection_view_model.dart';
import 'package:mocktail/mocktail.dart';

class MockMasterSearchRepository extends Mock
    implements MasterSearchRepository {}

class MockMasterTypeRepository extends Mock implements MasterTypeRepository {}

void main() {
  late MockMasterSearchRepository mockSearchRepository;
  late ProviderContainer container;

  const mockMasterTypes = [
    MasterType(id: 'type1', label: 'タイプ1'),
    MasterType(id: 'type2', label: 'タイプ2'),
  ];

  final mockMasters = [
    Master(
      id: '1',
      name: 'マスタ1',
      kana: 'マスタ1',
      type: mockMasterTypes[0],
      score: 0,
    ),
    Master(
      id: '2',
      name: 'マスタ2',
      kana: 'マスタ2',
      type: mockMasterTypes[1],
      score: 0,
    ),
  ];

  setUp(() {
    mockSearchRepository = MockMasterSearchRepository();
    container = ProviderContainer(
      overrides: [
        masterSearchRepositoryProvider.overrideWith(
          (ref) => Future.value(mockSearchRepository),
        ),
        availableMasterTypesProvider.overrideWith(
          (ref) => Future.value(mockMasterTypes),
        ),
      ],
    );

    // デフォルトの振る舞いを設定
    when(() => mockSearchRepository.getRecentMasters())
        .thenAnswer((_) async => mockMasters);
    when(() => mockSearchRepository.search(
          query: any(named: 'query'),
          masterTypeIds: any(named: 'masterTypeIds'),
        )).thenAnswer((_) async => mockMasters);
  });

  tearDown(() {
    container.dispose();
  });

  group('MasterSelectionViewModel', () {
    test('初期化時に全マスタと最近使用したマスタを取得する', () async {
      final state =
          await container.read(masterSelectionViewModelProvider.future);

      expect(state.searchResults, equals(mockMasters));
      expect(state.recentMasters, equals(mockMasters));
      expect(state.availableTypes, equals(mockMasterTypes));
      expect(state.query, isEmpty);
      expect(state.selectedTypes, isEmpty);
      expect(state.isLoading, isFalse);
    });

    test('検索クエリを設定すると検索が実行される', () async {
      await container.read(masterSelectionViewModelProvider.future);
      container.read(masterSelectionViewModelProvider.notifier).setQuery('テスト');

      verify(() => mockSearchRepository.search(
            query: 'テスト',
            masterTypeIds: [],
          )).called(1);
    });

    test('マスタタイプを選択すると検索が実行される', () async {
      await container.read(masterSelectionViewModelProvider.future);
      container
          .read(masterSelectionViewModelProvider.notifier)
          .toggleMasterType(mockMasterTypes[0]);

      verify(() => mockSearchRepository.search(
            query: '',
            masterTypeIds: [mockMasterTypes[0].id],
          )).called(1);
    });

    test('最近使用したマスタを追加すると履歴が更新される', () async {
      await container.read(masterSelectionViewModelProvider.future);
      await container
          .read(masterSelectionViewModelProvider.notifier)
          .addToRecentMasters(mockMasters[0]);

      verify(() => mockSearchRepository.addToHistory(mockMasters[0])).called(1);
      verify(() => mockSearchRepository.getRecentMasters()).called(1);
    });
  });
}
