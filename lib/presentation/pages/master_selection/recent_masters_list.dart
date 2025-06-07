import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layerx_technical_problem/domain/models/master.dart';

class RecentMastersList extends ConsumerWidget {
  final List<Master> recentMasters;
  final Function(Master) onMasterSelected;

  const RecentMastersList({
    super.key,
    required this.recentMasters,
    required this.onMasterSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (recentMasters.isEmpty) return const SizedBox.shrink();

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            '最近使用したマスタ',
            style: textTheme.titleSmall?.copyWith(
              color: colorScheme.onSurface,
              fontSize: isSmallScreen ? 12 : null,
            ),
          ),
        ),
        SizedBox(
          height: isSmallScreen ? 32 : 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: recentMasters.length,
            separatorBuilder: (_, __) => SizedBox(width: isSmallScreen ? 4 : 8),
            itemBuilder: (context, index) {
              final master = recentMasters[index];
              return ActionChip(
                label: Text(
                  master.name,
                  style: textTheme.labelMedium?.copyWith(
                    color: colorScheme.onPrimary,
                    fontSize: isSmallScreen ? 11 : null,
                  ),
                ),
                onPressed: () => onMasterSelected(master),
                backgroundColor: colorScheme.primary,
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallScreen ? 8 : 12,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
