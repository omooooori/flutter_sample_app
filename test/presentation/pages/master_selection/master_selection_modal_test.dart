import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/data/database/update_policy_manager.dart';
import 'package:layerx_technical_problem/data/repository/master_list_repository.dart';
import 'package:layerx_technical_problem/data/repository/master_type_repository.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';
import 'package:layerx_technical_problem/domain/models/master_type.dart';
import 'package:layerx_technical_problem/presentation/pages/master_selection/master_selection_modal.dart';
import 'package:layerx_technical_problem/presentation/pages/master_selection/provider/master_selection_state.dart';
import 'package:layerx_technical_problem/presentation/pages/master_selection/provider/master_selection_view_model.dart';
import 'package:layerx_technical_problem/presentation/pages/register/provider/register_screen_view_model.dart';
import 'package:mocktail/mocktail.dart';

class MockMasterTypeRepository extends Mock implements MasterTypeRepository {}

class MockMasterListRepository extends Mock implements MasterListRepository {}

class MockUpdatePolicyManager extends Mock implements UpdatePolicyManager {}

class MockMasterSelectionViewModel extends MasterSelectionViewModel {
  @override
  Future<MasterSelectionState> build() async {
    const mockType = MasterType(id: '1', label: 'テストタイプ');
    const mockMaster = Master(
      id: '1',
      name: 'テストマスタ',
      kana: 'テストマスタ',
      type: mockType,
      score: 0,
    );
    return const MasterSelectionState(
      query: '',
      selectedTypes: [],
      availableTypes: [mockType],
      searchResults: [mockMaster],
      isLoading: false,
      recentMasters: [mockMaster],
    );
  }
}

class MockRegisterScreenViewModel extends RegisterScreenViewModel {
  MockRegisterScreenViewModel({
    required super.masterTypeRepository,
    required super.masterListRepository,
    required super.updatePolicyManager,
  });

  @override
  bool isMasterSelected(Master master) {
    return false;
  }

  @override
  void toggleMasterSelection(Master master) {}
}

void main() {
  late MockMasterTypeRepository mockMasterTypeRepository;
  late MockMasterListRepository mockMasterListRepository;
  late MockUpdatePolicyManager mockUpdatePolicyManager;

  setUp(() {
    mockMasterTypeRepository = MockMasterTypeRepository();
    mockMasterListRepository = MockMasterListRepository();
    mockUpdatePolicyManager = MockUpdatePolicyManager();
  });

  testWidgets('マスタ選択モーダルが正しく表示される', (tester) async {
    final container = ProviderContainer(
      overrides: [
        masterSelectionViewModelProvider
            .overrideWith(() => MockMasterSelectionViewModel()),
        registerScreenViewModelProvider.overrideWith(
          (ref) => MockRegisterScreenViewModel(
            masterTypeRepository: mockMasterTypeRepository,
            masterListRepository: mockMasterListRepository,
            updatePolicyManager: mockUpdatePolicyManager,
          ),
        ),
      ],
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: Scaffold(
            body: MasterSelectionModal(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('最近使用したマスタ'), findsOneWidget);
    expect(find.text('完了'), findsOneWidget);
  });
}
