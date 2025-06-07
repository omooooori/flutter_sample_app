import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';
import 'package:layerx_technical_problem/presentation/pages/master_selection/master_search_field.dart';
import 'package:layerx_technical_problem/presentation/pages/master_selection/master_search_result_list.dart';
import 'package:layerx_technical_problem/presentation/pages/master_selection/master_type_chips.dart';
import 'package:layerx_technical_problem/presentation/pages/master_selection/recent_masters_list.dart';
import 'package:layerx_technical_problem/presentation/pages/register/provider/register_screen_view_model.dart';

import 'provider/master_selection_view_model.dart';

class MasterSelectionBody extends HookConsumerWidget {
  final ScrollController scrollController;

  const MasterSelectionBody({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(masterSelectionViewModelProvider).asData?.value;
    final vm = ref.read(masterSelectionViewModelProvider.notifier);
    final registerVm = ref.read(registerScreenViewModelProvider.notifier);

    useEffect(() {
      void onScroll() {
        final pos = scrollController.position;
        if (pos.pixels >= pos.maxScrollExtent - 100) {
          if (uiState != null && !uiState.isLoadingNext && uiState.hasMore) {
            vm.fetchNextPage();
          }
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController, uiState?.isLoadingNext, uiState?.hasMore]);

    if (uiState == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    void onMasterSelected(Master master) {
      registerVm.toggleMasterSelection(master);
      vm.addToRecentMasters(master);
    }

    void onRecentMasterSelected(Master master) {
      final selectedMasters =
          registerVm.state.selectedMastersByType[master.type.id] ?? [];
      if (!selectedMasters.any((m) => m.id == master.id)) {
        registerVm.toggleMasterSelection(master);
      }
      vm.addToRecentMasters(master);
    }

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: EdgeInsets.fromLTRB(
        isSmallScreen ? 8 : 16,
        16,
        isSmallScreen ? 8 : 16,
        24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MasterTypeChips(uiState: uiState),
          const SizedBox(height: 12),
          MasterSearchField(onQueryChanged: vm.setQuery),
          const SizedBox(height: 12),
          RecentMastersList(
            recentMasters: uiState.recentMasters,
            onMasterSelected: onRecentMasterSelected,
          ),
          Expanded(
            child: MasterSearchResultList(
              uiState: uiState,
              scrollController: scrollController,
              onMasterSelected: onMasterSelected,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  minimumSize: Size(isSmallScreen ? 80 : 100, 40),
                ),
                child: const Text('完了'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
