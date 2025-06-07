import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'provider/master_selection_state.dart';
import 'provider/master_selection_view_model.dart';

class MasterTypeChips extends ConsumerWidget {
  final MasterSelectionState uiState;

  const MasterTypeChips({super.key, required this.uiState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(masterSelectionViewModelProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return SizedBox(
      height: isSmallScreen ? 32 : 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: uiState.availableTypes.map((type) {
          final isSelected = uiState.selectedTypes.any(
            (t) => t.id == type.id,
          );
          return Padding(
            padding: EdgeInsets.only(right: isSmallScreen ? 4 : 8),
            child: FilterChip(
              label: Text(
                type.label,
                style: textTheme.labelLarge?.copyWith(
                  color: isSelected
                      ? colorScheme.onPrimary
                      : colorScheme.onSurface,
                  fontSize: isSmallScreen ? 11 : null,
                ),
              ),
              selected: isSelected,
              onSelected: (_) => vm.toggleMasterType(type),
              backgroundColor: colorScheme.surface,
              selectedColor: colorScheme.primary,
              checkmarkColor: colorScheme.onPrimary,
              padding: EdgeInsets.symmetric(
                horizontal: isSmallScreen ? 8 : 12,
                vertical: isSmallScreen ? 0 : 4,
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
          );
        }).toList(),
      ),
    );
  }
}
