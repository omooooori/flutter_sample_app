import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/data/database/update_policy_manager.dart';
import 'package:layerx_technical_problem/data/repository/master_list_repository.dart';
import 'package:layerx_technical_problem/data/repository/master_type_repository.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';
import 'package:layerx_technical_problem/domain/models/master_type.dart';
import 'package:layerx_technical_problem/presentation/pages/register/provider/register_screen_state.dart';
import 'package:layerx_technical_problem/presentation/pages/register/provider/register_screen_view_model.dart';
import 'package:layerx_technical_problem/presentation/pages/register/register_screen.dart';
import 'package:mocktail/mocktail.dart';

class MockMasterTypeRepository extends Mock implements MasterTypeRepository {}

class MockMasterListRepository extends Mock implements MasterListRepository {}

class MockUpdatePolicyManager extends Mock implements UpdatePolicyManager {}

class MockRegisterScreenViewModel extends StateNotifier<RegisterScreenState>
    implements RegisterScreenViewModel {
  final MasterTypeRepository _masterTypeRepository;
  final MasterListRepository _masterListRepository;
  final UpdatePolicyManager _updatePolicyManager;

  MockRegisterScreenViewModel({
    required MasterTypeRepository masterTypeRepository,
    required MasterListRepository masterListRepository,
    required UpdatePolicyManager updatePolicyManager,
  })  : _masterTypeRepository = masterTypeRepository,
        _masterListRepository = masterListRepository,
        _updatePolicyManager = updatePolicyManager,
        super(const RegisterScreenState(selectedMastersByType: {}));

  @override
  MasterTypeRepository get masterTypeRepository => _masterTypeRepository;

  @override
  MasterListRepository get masterListRepository => _masterListRepository;

  @override
  UpdatePolicyManager get updatePolicyManager => _updatePolicyManager;

  @override
  Future<void> init() async {
    state = state.copyWith(isLoading: true);
    try {
      await Future.value(); // 非同期処理をシミュレート
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, hasError: true);
    }
  }

  @override
  void toggleMasterSelection(Master master) {
    final currentState = state;
    final masterTypeId = master.type.id;
    final selectedMasters =
        Map<String, List<Master>>.from(currentState.selectedMastersByType);

    if (!selectedMasters.containsKey(masterTypeId)) {
      selectedMasters[masterTypeId] = [];
    }

    final typeList = List<Master>.from(selectedMasters[masterTypeId] ?? []);
    final masterIndex = typeList.indexWhere((m) => m.id == master.id);
    if (masterIndex != -1) {
      typeList.removeAt(masterIndex);
    } else {
      typeList.add(master);
    }

    if (typeList.isEmpty) {
      selectedMasters.remove(masterTypeId);
    } else {
      selectedMasters[masterTypeId] = typeList;
    }

    state = currentState.copyWith(selectedMastersByType: selectedMasters);
  }

  @override
  bool isMasterSelected(Master master) {
    final selectedMasters = state.selectedMastersByType[master.type.id] ?? [];
    return selectedMasters.any((m) => m.id == master.id);
  }
}

void main() {
  late MockMasterTypeRepository mockMasterTypeRepository;
  late MockMasterListRepository mockMasterListRepository;
  late MockUpdatePolicyManager mockUpdatePolicyManager;
  late MockRegisterScreenViewModel mockViewModel;
  late ProviderContainer container;

  setUp(() {
    mockMasterTypeRepository = MockMasterTypeRepository();
    mockMasterListRepository = MockMasterListRepository();
    mockUpdatePolicyManager = MockUpdatePolicyManager();

    mockViewModel = MockRegisterScreenViewModel(
      masterTypeRepository: mockMasterTypeRepository,
      masterListRepository: mockMasterListRepository,
      updatePolicyManager: mockUpdatePolicyManager,
    );

    container = ProviderContainer(
      overrides: [
        registerScreenViewModelProvider.overrideWith((_) => mockViewModel),
      ],
    );

    addTearDown(container.dispose);
  });

  testWidgets('RegisterScreenの初期表示テスト', (WidgetTester tester) async {
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: RegisterScreen(),
        ),
      ),
    );

    // 初期表示時のローディング状態を待機
    await tester.pump();

    // init()の完了を待機
    await tester.pumpAndSettle();

    expect(find.text('検索画面'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('エラー状態の表示テスト', (WidgetTester tester) async {
    mockViewModel.state = const RegisterScreenState(
      selectedMastersByType: {},
      hasError: true,
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: RegisterScreen(),
        ),
      ),
    );

    await tester.pump();

    expect(find.text('データの読み込みに失敗しました'), findsOneWidget);
    expect(find.text('再読み込み'), findsOneWidget);
  });

  testWidgets('マスタ選択状態の表示テスト', (WidgetTester tester) async {
    const masterType = MasterType(id: 'test', label: 'テスト');
    const master = Master(
      id: '1',
      name: 'テストマスタ',
      kana: 'テストマスタ',
      type: masterType,
      score: 0,
    );

    mockViewModel.state = RegisterScreenState(
      selectedMastersByType: {
        masterType.id: [master],
      },
    );

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: const MaterialApp(
          home: RegisterScreen(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // InputChipを探す
    final inputChipFinder = find.byType(InputChip);
    expect(inputChipFinder, findsOneWidget);

    // InputChipのonDeletedを呼び出す
    final InputChip inputChip = tester.widget(inputChipFinder);
    inputChip.onDeleted?.call();
    await tester.pumpAndSettle();

    // マスタが削除されたことを確認
    expect(mockViewModel.state.selectedMastersByType[masterType.id], isNull);
  });
}
