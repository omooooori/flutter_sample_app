import 'package:flutter/material.dart';

class MasterSearchField extends StatelessWidget {
  final ValueChanged<String> onQueryChanged;

  const MasterSearchField({super.key, required this.onQueryChanged});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 360;

    return SizedBox(
      height: isSmallScreen ? 40 : 48,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: colorScheme.onSurface,
            size: isSmallScreen ? 20 : 24,
          ),
          hintText: 'マスタを検索',
          hintStyle: TextStyle(
            color: colorScheme.onSurface.withOpacity(0.6),
            fontSize: isSmallScreen ? 12 : null,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: colorScheme.surfaceContainerHighest,
          contentPadding: EdgeInsets.symmetric(
            horizontal: isSmallScreen ? 8 : 12,
            vertical: isSmallScreen ? 8 : 12,
          ),
          isDense: true,
        ),
        style: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
          fontSize: isSmallScreen ? 12 : null,
        ),
        onChanged: onQueryChanged,
      ),
    );
  }
}
