import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/common/utils/logger.dart';
import 'package:layerx_technical_problem/data/database/update_policy_manager.dart';
import 'package:layerx_technical_problem/data/repository/master_list_repository.dart';
import 'package:layerx_technical_problem/data/repository/master_type_repository.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';

import 'register_screen_state.dart';

final registerScreenViewModelProvider = StateNotifierProvider.autoDispose<
    RegisterScreenViewModel, RegisterScreenState>((ref) {
  final masterTypeRepository = ref.read(masterTypeRepositoryProvider);
  final masterListRepository = ref.read(masterListRepositoryProvider);
  final updatePolicyManager = ref.watch(updatePolicyManagerInitProvider).value!;

  return RegisterScreenViewModel(
    masterTypeRepository: masterTypeRepository,
    masterListRepository: masterListRepository,
    updatePolicyManager: updatePolicyManager,
  );
});

class RegisterScreenViewModel extends StateNotifier<RegisterScreenState> {
  RegisterScreenViewModel({
    required this.masterTypeRepository,
    required this.masterListRepository,
    required this.updatePolicyManager,
  }) : super(
          const RegisterScreenState(
              selectedMastersByType: {}, isLoading: false),
        );

  final MasterTypeRepository masterTypeRepository;
  final MasterListRepository masterListRepository;
  final UpdatePolicyManager updatePolicyManager;

  /// アプリ起動時の初期化処理
  Future<void> init() async {
    state = state.copyWith(isLoading: true);

    try {
      if (!await updatePolicyManager.isUpdatedToday()) {
        await _updateMasterData();
      }
    } catch (e, _) {
      AppLogger.debug('マスタデータの更新に失敗: $e');
      state = state.copyWith(hasError: true);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  /// マスタデータの更新処理
  Future<void> _updateMasterData() async {
    final masterTypes = await masterTypeRepository.fetchAvailableMasterTypes();
    await masterTypeRepository.saveMasterTypes(masterTypes);

    final masters = await masterListRepository.fetchAllMasters();
    await masterListRepository.saveMasters(masters);

    await updatePolicyManager.markAsUpdatedNow();
  }

  /// マスタの選択状態を切り替え
  void toggleMasterSelection(Master master) {
    final current = <Master>[
      ...state.selectedMastersByType[master.type.id] ?? []
    ];
    final index = current.indexWhere((m) => m.id == master.id);

    if (index >= 0) {
      current.removeAt(index);
    } else {
      current.add(master);
    }

    state = state.copyWith(
      selectedMastersByType: {
        ...state.selectedMastersByType,
        master.type.id: current,
      },
    );
  }

  /// マスタが選択済みかどうかを確認
  bool isMasterSelected(Master master) {
    final selectedMasters = state.selectedMastersByType[master.type.id] ?? [];
    return selectedMasters.any((m) => m.id == master.id);
  }
}
