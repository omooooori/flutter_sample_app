import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'common/theme/layerx_theme.dart';
import 'common/utils/logger.dart';
import 'presentation/pages/register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLogger.initialize();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sample App',
      theme: layerXThemeDataLight,
      darkTheme: layerXThemeDataDark,
      themeMode: ThemeMode.system,
      home: const RegisterScreen(),
    );
  }
}
