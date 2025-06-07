import 'package:flutter/material.dart';

class LayerXLightColors {
  // Gray scale (light theme)
  static const gray1 = Color(0xFFFCFCFE);
  static const gray2 = Color(0xFFF8F9FD);
  static const gray3 = Color(0xFFEEF0F7);
  static const gray4 = Color(0xFFE6E8F2);
  static const gray5 = Color(0xFFDEE0ED);
  static const gray6 = Color(0xFFD6D8E7);
  static const gray7 = Color(0xFFCBCEE0);
  static const gray8 = Color(0xFFB6BAD2);
  static const gray9 = Color(0xFF898CA3);
  static const gray10 = Color(0xFF7E8297);
  static const gray11 = Color(0xFF606375);
  static const gray12 = Color(0xFF1E1F2B);

  // Blue scale
  static const blue1 = Color(0xFFFCFDFF);
  static const blue2 = Color(0xFFF5FAFF);
  static const blue3 = Color(0xFFEAF2FF);
  static const blue4 = Color(0xFFD9EAFF);
  static const blue5 = Color(0xFFC8E0FF);
  static const blue6 = Color(0xFFB5D2FF);
  static const blue7 = Color(0xFF99BFFF);
  static const blue8 = Color(0xFF73A4FF);
  static const blue9 = Color(0xFF003CFF); // primary
  static const blue10 = Color(0xFF0022ED);
  static const blue11 = Color(0xFF124DF3);
  static const blue12 = Color(0xFF0E296F);

  static const white = Color(0xFFFFFFFF);
}

class LayerXDarkRadixColors {
  // Gray scale
  static const gray1 = Color(0xFF111113);
  static const gray2 = Color(0xFF19191B);
  static const gray3 = Color(0xFF222325);
  static const gray4 = Color(0xFF292A2E);
  static const gray5 = Color(0xFF303136);
  static const gray6 = Color(0xFF393A40);
  static const gray7 = Color(0xFF46484F);
  static const gray8 = Color(0xFF5F606A);
  static const gray9 = Color(0xFF6C6E79);
  static const gray10 = Color(0xFF797B86);
  static const gray11 = Color(0xFFB2B3BD);
  static const gray12 = Color(0xFFEEEFF0);

  // Blue scale
  static const blue1 = Color(0xFF0C111C);
  static const blue2 = Color(0xFF111725);
  static const blue3 = Color(0xFF172448);
  static const blue4 = Color(0xFF1D2E61);
  static const blue5 = Color(0xFF243974);
  static const blue6 = Color(0xFF2D4484);
  static const blue7 = Color(0xFF375098);
  static const blue8 = Color(0xFF405EB2);
  static const blue9 = Color(0xFF3D63DD); // primary
  static const blue10 = Color(0xFF3F5CB0);
  static const blue11 = Color(0xFF93B4FF);
  static const blue12 = Color(0xFFD5E2FF);
}

final layerXLightColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: LayerXLightColors.blue9,
).copyWith(
  surface: LayerXLightColors.gray1,
  onSurface: LayerXLightColors.gray12,
  surfaceContainerHighest: LayerXLightColors.gray3,
  outline: LayerXLightColors.gray6,
);

final layerXDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: LayerXDarkRadixColors.blue9,
).copyWith(
  surface: LayerXDarkRadixColors.gray2,
  onSurface: LayerXDarkRadixColors.gray11,
  surfaceContainerHighest: LayerXDarkRadixColors.gray4,
  outline: LayerXDarkRadixColors.gray6,
);
