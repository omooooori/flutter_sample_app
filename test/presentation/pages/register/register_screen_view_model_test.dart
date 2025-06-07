import 'package:flutter_test/flutter_test.dart';
import 'package:layerx_technical_problem/data/database/update_policy_manager.dart';
import 'package:layerx_technical_problem/data/repository/master_list_repository.dart';
import 'package:layerx_technical_problem/data/repository/master_type_repository.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';
import 'package:layerx_technical_problem/domain/models/master_type.dart';
import 'package:layerx_technical_problem/presentation/pages/register/provider/register_screen_view_model.dart';
import 'package:mocktail/mocktail.dart';

class MockMasterTypeRepository extends Mock implements MasterTypeRepository {}

class MockMasterListRepository extends Mock implements MasterListRepository {}

class MockUpdatePolicyManager extends Mock implements UpdatePolicyManager {}

void main() {
  late MockMasterTypeRepository mockMasterTypeRepository;
  late MockMasterListRepository mockMasterListRepository;
  late MockUpdatePolicyManager mockUpdatePolicyManager;
  late RegisterScreenViewModel viewModel;

  setUp(() {
    mockMasterTypeRepository = MockMasterTypeRepository();
    mockMasterListRepository = MockMasterListRepository();
    mockUpdatePolicyManager = MockUpdatePolicyManager();

    // モックの振る舞いをリセット
    reset(mockMasterTypeRepository);
    reset(mockMasterListRepository);
    reset(mockUpdatePolicyManager);

    viewModel = RegisterScreenViewModel(
      masterTypeRepository: mockMasterTypeRepository,
      masterListRepository: mockMasterListRepository,
      updatePolicyManager: mockUpdatePolicyManager,
    );
  });

  group('init', () {
    test('今日更新済みの場合、更新処理をスキップする', () async {
      when(() => mockUpdatePolicyManager.isUpdatedToday())
          .thenAnswer((_) async => true);

      await viewModel.init();

      verifyNever(() => mockMasterTypeRepository.fetchAvailableMasterTypes());
      verifyNever(() => mockMasterListRepository.fetchAllMasters());
      verifyNever(() => mockUpdatePolicyManager.markAsUpdatedNow());

      expect(viewModel.state.isLoading, false);
      expect(viewModel.state.hasError, false);
    });

    test('今日更新していない場合、更新処理を実行する', () async {
      when(() => mockUpdatePolicyManager.isUpdatedToday())
          .thenAnswer((_) async => false);

      const masterTypes = [
        MasterType(id: 'test1', label: 'テスト1'),
        MasterType(id: 'test2', label: 'テスト2'),
      ];
      when(() => mockMasterTypeRepository.fetchAvailableMasterTypes())
          .thenAnswer((_) async => masterTypes);

      const masters = [
        Master(
          id: '1',
          name: 'テストマスタ1',
          kana: 'テストマスタ1',
          type: MasterType(id: 'test1', label: 'テスト1'),
          score: 0,
        ),
        Master(
          id: '2',
          name: 'テストマスタ2',
          kana: 'テストマスタ2',
          type: MasterType(id: 'test2', label: 'テスト2'),
          score: 0,
        ),
      ];
      when(() => mockMasterListRepository.fetchAllMasters())
          .thenAnswer((_) async => masters);

      when(() => mockMasterTypeRepository.saveMasterTypes(any()))
          .thenAnswer((_) async {});
      when(() => mockMasterListRepository.saveMasters(any()))
          .thenAnswer((_) async {});
      when(() => mockUpdatePolicyManager.markAsUpdatedNow())
          .thenAnswer((_) async {});

      await viewModel.init();

      verify(() => mockMasterTypeRepository.fetchAvailableMasterTypes())
          .called(1);
      verify(() => mockMasterTypeRepository.saveMasterTypes(masterTypes))
          .called(1);
      verify(() => mockMasterListRepository.fetchAllMasters()).called(1);
      verify(() => mockMasterListRepository.saveMasters(masters)).called(1);
      verify(() => mockUpdatePolicyManager.markAsUpdatedNow()).called(1);

      expect(viewModel.state.isLoading, false);
      expect(viewModel.state.hasError, false);
    });

    test('更新処理でエラーが発生した場合、エラー状態になる', () async {
      when(() => mockUpdatePolicyManager.isUpdatedToday())
          .thenAnswer((_) async => false);

      when(() => mockMasterTypeRepository.fetchAvailableMasterTypes())
          .thenThrow(Exception('テストエラー'));

      await viewModel.init();

      expect(viewModel.state.isLoading, false);
      expect(viewModel.state.hasError, true);
    });
  });

  group('toggleMasterSelection', () {
    test('マスタの選択状態を正しく切り替える', () {
      const masterType = MasterType(id: 'test', label: 'テスト');
      const master = Master(
        id: '1',
        name: 'テストマスタ',
        kana: 'テストマスタ',
        type: masterType,
        score: 0,
      );

      expect(viewModel.state.selectedMastersByType[masterType.id], null);

      viewModel.toggleMasterSelection(master);
      expect(viewModel.state.selectedMastersByType[masterType.id], [master]);

      viewModel.toggleMasterSelection(master);
      expect(viewModel.state.selectedMastersByType[masterType.id], isEmpty);

      viewModel.toggleMasterSelection(master);
      expect(viewModel.state.selectedMastersByType[masterType.id], [master]);
    });
  });
}
