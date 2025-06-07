import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';
import 'package:layerx_technical_problem/domain/models/master_type.dart';

part 'master_selection_state.freezed.dart';

@freezed
class MasterSelectionState with _$MasterSelectionState {
  const factory MasterSelectionState({
    required String query,
    required List<MasterType> selectedTypes,
    required List<MasterType> availableTypes,
    required List<Master> searchResults,
    required bool isLoading,
    required List<Master> recentMasters,
    @Default(false) bool isLoadingNext,
    @Default(true) bool hasMore,
  }) = _MasterSelectionState;
}
