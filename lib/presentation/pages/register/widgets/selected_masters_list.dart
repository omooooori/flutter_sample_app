import 'package:flutter/material.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';

class SelectedMastersList extends StatelessWidget {
  final Map<String, List<Master>> selectedMastersByType;
  final Function(Master) onMasterDeleted;

  const SelectedMastersList({
    super.key,
    required this.selectedMastersByType,
    required this.onMasterDeleted,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    if (selectedMastersByType.isEmpty) {
      return Text(
        '選択されたマスタはありません',
        style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
      );
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: selectedMastersByType.entries.expand((entry) {
        return entry.value.map((master) {
          return InputChip(
            label: Text(
              master.name,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
            onDeleted: () => onMasterDeleted(master),
            backgroundColor: colorScheme.primary,
            deleteIconColor: colorScheme.onPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          );
        });
      }).toList(),
    );
  }
}
