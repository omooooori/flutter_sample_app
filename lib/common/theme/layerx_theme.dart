import 'package:flutter/material.dart';
import 'layerx_color_scheme.dart';
import 'layerx_typography.dart';

final layerXThemeDataLight = ThemeData(
  useMaterial3: true,
  colorScheme: layerXLightColorScheme,
  textTheme: layerXTextTheme,
  scaffoldBackgroundColor: layerXLightColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: layerXLightColorScheme.surface,
    foregroundColor: layerXLightColorScheme.onSurface,
    elevation: 0,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: layerXLightColorScheme.surfaceContainerHighest,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: layerXLightColorScheme.primary,
      foregroundColor: layerXLightColorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
);

final layerXThemeDataDark = ThemeData(
  useMaterial3: true,
  colorScheme: layerXDarkColorScheme,
  textTheme: layerXTextTheme,
  scaffoldBackgroundColor: layerXDarkColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: layerXDarkColorScheme.surface,
    foregroundColor: layerXDarkColorScheme.onSurface,
    elevation: 0,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: layerXDarkColorScheme.surfaceContainerHighest,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: layerXDarkColorScheme.primary,
      foregroundColor: layerXDarkColorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
);
