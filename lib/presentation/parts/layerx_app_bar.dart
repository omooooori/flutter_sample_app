import 'package:flutter/material.dart';

class LayerXAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const LayerXAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final appBarTheme = Theme.of(context).appBarTheme;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      bottom: false,
      child: Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.centerLeft,
        color: appBarTheme.backgroundColor,
        child: Text(
          title,
          style: textTheme.titleLarge?.copyWith(
            color: appBarTheme.foregroundColor,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
