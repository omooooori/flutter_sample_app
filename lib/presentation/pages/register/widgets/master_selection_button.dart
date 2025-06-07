import 'package:flutter/material.dart';
import 'package:layerx_technical_problem/presentation/pages/master_selection/master_selection_modal.dart';

class MasterSelectionButton extends StatelessWidget {
  const MasterSelectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ElevatedButton.icon(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => const MasterSelectionModal(),
        );
      },
      icon: Icon(Icons.add, color: colorScheme.onPrimary),
      label: Text(
        'マスタを選択',
        style: textTheme.labelLarge?.copyWith(color: colorScheme.onPrimary),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
