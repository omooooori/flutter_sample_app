import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/common/utils/debouncer.dart';
import 'package:layerx_technical_problem/common/utils/logger.dart';
import 'package:layerx_technical_problem/data/repository/master_search_repository.dart';
import 'package:layerx_technical_problem/data/repository/master_type_repository.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';
import 'package:layerx_technical_problem/domain/models/master_type.dart';
import 'package:layerx_technical_problem/presentation/pages/master_selection/provider/master_selection_state.dart';

final masterSelectionViewModelProvider = AsyncNotifierProvider.autoDispose<
    MasterSelectionViewModel,
    MasterSelectionState>(MasterSelectionViewModel.new);

class MasterSelectionViewModel
    extends AutoDisposeAsyncNotifier<MasterSelectionState> {
  final _debouncer = Debouncer(milliseconds: 200);
  late final MasterSearchRepository _repository;

  @override
  Future<MasterSelectionState> build() async {
    _repository = await ref.watch(masterSearchRepositoryProvider.future);
    final availableTypes = await ref.watch(availableMasterTypesProvider.future);
    final recentMasters = await _repository.getRecentMasters();

    return MasterSelectionState(
      query: '',
      selectedTypes: const [],
      availableTypes: availableTypes,
      searchResults: [],
      isLoading: false,
      recentMasters: recentMasters,
      isLoadingNext: false,
      hasMore: true,
    );
  }

  /// 検索クエリを設定し、必要に応じて検索を実行
  void setQuery(String query) {
    state = AsyncData(state.requireValue.copyWith(
        query: query,
      searchResults: [],
      hasMore: true,
    ));
    _debouncer.run(() {
      _performSearch();
    });
  }

  /// マスタタイプの選択状態を切り替え
  void toggleMasterType(MasterType type) {
    final current = [...state.requireValue.selectedTypes];
    current.any((t) => t.id == type.id)
        ? current.removeWhere((t) => t.id == type.id)
        : current.add(type);

    final next = state.requireValue.copyWith(selectedTypes: current);
    state = AsyncData(next);
    _performSearch();
  }

  /// 最近使用したマスタに追加
  Future<void> addToRecentMasters(Master master) async {
    try {
      await _repository.addToHistory(master);
      final recentMasters = await _repository.getRecentMasters();

      // 現在の状態を保持したまま、recentMastersのみを更新
      final currentState = state.requireValue;
      state = AsyncData(currentState.copyWith(
        recentMasters: recentMasters,
      ));
    } catch (e, st) {
      AppLogger.error('最近使用したマスタの更新に失敗', e, st);
    }
  }

  /// 検索を実行
  Future<void> _performSearch() async {
    final s = state.requireValue;
    final query = s.query;
    final masterTypeIds = s.selectedTypes.map((e) => e.id).toList();

    state = AsyncData(s.copyWith(isLoading: true));
    AppLogger.debug('検索実行: query=$query, types=$masterTypeIds');

    try {
      final results = await _repository.search(
        query: s.query,
        masterTypeIds: s.selectedTypes.map((e) => e.id).toList(),
        offset: 0,
        limit: 50,
      );
      state = AsyncData(s.copyWith(
        searchResults: results,
        isLoading: false,
        hasMore: results.length == 50,
      ));
    } catch (e, st) {
      AppLogger.error('検索失敗', e, st);
      state = AsyncData(s.copyWith(
        searchResults: [],
        isLoading: false,
      ));
    }
  }

  Future<void> fetchNextPage() async {
    AppLogger.error('ページネーション取得');
    final s = state.requireValue;

    if (s.isLoadingNext || !s.hasMore) return;

    state = AsyncData(s.copyWith(isLoadingNext: true));
    final offset = s.searchResults.length;
    const limit = 50;

    try {
      final newResults = await _repository.search(
        query: s.query,
        masterTypeIds: s.selectedTypes.map((e) => e.id).toList(),
        offset: offset,
        limit: limit,
      );

      state = AsyncData(s.copyWith(
        searchResults: [...s.searchResults, ...newResults],
        isLoadingNext: false,
        hasMore: newResults.length == limit,
      ));
    } catch (e, st) {
      AppLogger.error('ページネーション取得失敗', e, st);
      state = AsyncData(s.copyWith(isLoadingNext: false));
    }
  }
}
