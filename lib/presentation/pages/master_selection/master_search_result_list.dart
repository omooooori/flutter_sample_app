import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';
import 'package:layerx_technical_problem/presentation/pages/master_selection/provider/master_selection_view_model.dart';
import 'package:layerx_technical_problem/presentation/pages/register/provider/register_screen_view_model.dart';

import 'provider/master_selection_state.dart';

class MasterSearchResultList extends ConsumerWidget {
  final MasterSelectionState uiState;
  final ScrollController scrollController;
  final Function(Master) onMasterSelected;

  const MasterSearchResultList({
    super.key,
    required this.uiState,
    required this.scrollController,
    required this.onMasterSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    if (uiState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (uiState.searchResults.isEmpty) {
      return Center(
        child: Text(
          '一致するマスタが見つかりません',
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface,
            fontSize: isSmallScreen ? 12 : null,
          ),
        ),
      );
    }

    return ListView.builder(
      controller: scrollController,
      itemCount: uiState.searchResults.length + (uiState.isLoadingNext ? 1 : 0),
      itemBuilder: (_, index) {
        if (index >= uiState.searchResults.length) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final master = uiState.searchResults[index];
        final isSelected = ref
                .watch(registerScreenViewModelProvider)
                .selectedMastersByType[master.type.id]
                ?.any((m) => m.id == master.id) ??
            false;

        return CheckboxListTile(
          title: Text(
            master.name,
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface,
              fontSize: isSmallScreen ? 12 : null,
            ),
          ),
          value: isSelected,
          onChanged: (_) => onMasterSelected(master),
          activeColor: colorScheme.primary,
          checkColor: colorScheme.onPrimary,
          dense: isSmallScreen,
          contentPadding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 4 : 16,
            vertical: isSmallScreen ? 4 : 8,
          ),
        );
      },
    );
  }
}
