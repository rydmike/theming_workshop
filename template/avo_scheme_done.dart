import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:theming_workshop/workshop/theme/avo_tokens.dart';

/// The AvoScheme contains ColorScheme we experiment with for AvoDelish.
///
/// Begin with figuring out your ColorScheme
class AvoScheme {
  AvoScheme._();

  /// 1) M3 seed generated scheme, with main brand color locked in.
  static final ColorScheme seedLight = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: AvoTokens.avocado,

    // Color overrides to token value
    primary: AvoTokens.avocado,
  );
  static final ColorScheme seedDark = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: AvoTokens.avocado,
    // Color overrides to token value
    primaryContainer: AvoTokens.avocado,
  );

  /// 2) Generated with M3 WEB theme builder
  /// https://m3.material.io/theme-builder#/custom
  /// Using tokens:
  ///
  /// * Primary: ThemeTokens.avocado = 334601
  /// * Secondary: ThemeTokens.avocadoMeat = FFF5AD
  /// * Tertiary: ThemeTokens.avocadoCore = 4C1C0A
  static const mtbLight = ColorScheme.light(
    primary: Color(0xFF4D6706),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFCEEF84),
    onPrimaryContainer: Color(0xFF151F00),
    secondary: Color(0xFF686000),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFF3E569),
    onSecondaryContainer: Color(0xFF1F1C00),
    tertiary: Color(0xFF9A4525),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFDBCF),
    onTertiaryContainer: Color(0xFF390C00),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFEFCF4),
    onBackground: Color(0xFF1B1C17),
    surface: Color(0xFFFEFCF4),
    onSurface: Color(0xFF1B1C17),
    surfaceVariant: Color(0xFFE2E4D4),
    onSurfaceVariant: Color(0xFF45483C),
    outline: Color(0xFF76786B),
    onInverseSurface: Color(0xFFF2F1E9),
    inverseSurface: Color(0xFF30312C),
    inversePrimary: Color(0xFFB2D26B),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF4D6706),
    outlineVariant: Color(0xFFC6C8B8),
    scrim: Color(0xFF000000),
  );
  static const mtbDark = ColorScheme.dark(
    primary: Color(0xFFB2D26B),
    onPrimary: Color(0xFF263500),
    primaryContainer: Color(0xFF394E00),
    onPrimaryContainer: Color(0xFFCEEF84),
    secondary: Color(0xFFD6C950),
    onSecondary: Color(0xFF363100),
    secondaryContainer: Color(0xFF4E4800),
    onSecondaryContainer: Color(0xFFF3E569),
    tertiary: Color(0xFFFFB59C),
    onTertiary: Color(0xFF5C1900),
    tertiaryContainer: Color(0xFF7C2E10),
    onTertiaryContainer: Color(0xFFFFDBCF),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1B1C17),
    onBackground: Color(0xFFE4E3DB),
    surface: Color(0xFF1B1C17),
    onSurface: Color(0xFFE4E3DB),
    surfaceVariant: Color(0xFF45483C),
    onSurfaceVariant: Color(0xFFC6C8B8),
    outline: Color(0xFF909284),
    onInverseSurface: Color(0xFF1B1C17),
    inverseSurface: Color(0xFFE4E3DB),
    inversePrimary: Color(0xFF4D6706),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFB2D26B),
    outlineVariant: Color(0xFF45483C),
    scrim: Color(0xFF000000),
  );

  /// 3) M3 seed generated scheme, with main brand color locked in.
  static final ColorScheme seedOverrideLight = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: AvoTokens.avocado,
    // Color overrides to token values
    primary: AvoTokens.avocado,
    primaryContainer: AvoTokens.avocadoMeat,
    secondary: AvoTokens.avocadoRipe,
    secondaryContainer: AvoTokens.avocadoTender,
    tertiary: AvoTokens.avocadoCore,
    tertiaryContainer: AvoTokens.effectLight,
    onTertiaryContainer: AvoTokens.effectDark,
  );
  static final ColorScheme seedOverrideDark = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: AvoTokens.avocado,
    // Color overrides to token values
    primary: AvoTokens.avocadoLush,
    primaryContainer: AvoTokens.avocadoPrime,
    onPrimaryContainer: AvoTokens.avocado,
    secondary: AvoTokens.avocadoTender,
    secondaryContainer: AvoTokens.avocadoRipe,
    tertiary: AvoTokens.effectLight,
    onTertiary: AvoTokens.effectDark,
    tertiaryContainer: AvoTokens.avocadoCore,
    onTertiaryContainer: AvoTokens.effectLight,
  );

  /// 4) FlexSeedScheme, more options in seed results and you can customize it.
  /// You can use 6 seed keys instead of only 1, one for each
  /// tonal palette
  static final ColorScheme seedsLight = SeedColorScheme.fromSeeds(
    brightness: Brightness.light,
    primaryKey: AvoTokens.avocado,
    secondaryKey: AvoTokens.avocadoRipe,
    tertiaryKey: AvoTokens.avocadoCore,
    tones: FlexTones.chroma(Brightness.light),
    // Color overrides to token values
    primary: AvoTokens.avocado,
  );
  static final ColorScheme seedsDark = SeedColorScheme.fromSeeds(
    brightness: Brightness.dark,
    primaryKey: AvoTokens.avocado,
    secondaryKey: AvoTokens.avocadoRipe,
    tertiaryKey: AvoTokens.avocadoCore,
    tones: FlexTones.chroma(Brightness.dark),
    // Color overrides to token values
    primaryContainer: AvoTokens.avocado,
  );

  /// 5) FlexSeedScheme, more options in seed results and you can customize it.
  /// You can use 6 seed keys instead of only 1, one for each
  /// tonal palette
  static final ColorScheme seedsOverrideLight = SeedColorScheme.fromSeeds(
    brightness: Brightness.light,
    primaryKey: AvoTokens.avocado,
    secondaryKey: AvoTokens.avocadoRipe,
    tertiaryKey: AvoTokens.avocadoCore,
    tones: FlexTones.candyPop(Brightness.light),
    // Color overrides to token values
    primary: AvoTokens.avocado,
    primaryContainer: AvoTokens.avocadoMeat,
    secondary: AvoTokens.avocadoRipe,
    secondaryContainer: AvoTokens.avocadoTender,
    tertiary: AvoTokens.avocadoCore,
    tertiaryContainer: AvoTokens.effectLight,
    onTertiaryContainer: AvoTokens.effectDark,
  );
  static final ColorScheme seedsOverrideDark = SeedColorScheme.fromSeeds(
    brightness: Brightness.dark,
    primaryKey: AvoTokens.avocado,
    secondaryKey: AvoTokens.avocadoRipe,
    tertiaryKey: AvoTokens.avocadoCore,
    tones: FlexTones.candyPop(Brightness.dark),
    // Color overrides to token values
    primary: AvoTokens.avocadoLush,
    primaryContainer: AvoTokens.avocadoPrime,
    onPrimaryContainer: AvoTokens.avocado,
    secondary: AvoTokens.avocadoTender,
    secondaryContainer: AvoTokens.avocadoRipe,
    tertiary: AvoTokens.effectLight,
    onTertiary: AvoTokens.effectDark,
    tertiaryContainer: AvoTokens.avocadoCore,
    onTertiaryContainer: AvoTokens.effectLight,
  );

  /// 6) A second theme for the red red wine bar...
  static const ColorScheme wineBarLight = ColorScheme.light(
    primary: Color(0xff9b1b30),
    onPrimary: Color(0xfffefcfc),
    primaryContainer: Color(0xffedbac2),
    onPrimaryContainer: Color(0xff080606),
    secondary: Color(0xffa4121c),
    onSecondary: Color(0xfffefcfc),
    secondaryContainer: Color(0xffffdad5),
    onSecondaryContainer: Color(0xff080707),
    tertiary: Color(0xffa70043),
    onTertiary: Color(0xfffefbfc),
    tertiaryContainer: Color(0xffffd9df),
    onTertiaryContainer: Color(0xff080707),
    error: Color(0xff790000),
    onError: Color(0xfffdfbfb),
    errorContainer: Color(0xfff1d8d8),
    onErrorContainer: Color(0xff080707),
    background: Color(0xfff8f1f2),
    onBackground: Color(0xff050505),
    surface: Color(0xfffbf6f7),
    onSurface: Color(0xff030303),
    surfaceVariant: Color(0xffe8dfe0),
    onSurfaceVariant: Color(0xff070607),
    outline: Color(0xff787878),
    outlineVariant: Color(0xffc4c4c4),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff151112),
    onInverseSurface: Color(0xfffbfbfb),
    inversePrimary: Color(0xffffb4c1),
    surfaceTint: Color(0xff9b1b30),
  );
  static const ColorScheme wineBarDark = ColorScheme.dark(
    primary: Color(0xffe4677c),
    onPrimary: Color(0xfffff7f9),
    primaryContainer: Color(0xff9b1b30),
    onPrimaryContainer: Color(0xfff8e6e9),
    secondary: Color(0xffbd545b),
    onSecondary: Color(0xfffdf6f7),
    secondaryContainer: Color(0xff930012),
    onSecondaryContainer: Color(0xfff7e2e5),
    tertiary: Color(0xffc87a98),
    onTertiary: Color(0xfffef9fb),
    tertiaryContainer: Color(0xff910037),
    onTertiaryContainer: Color(0xfff7e2ea),
    error: Color(0xffcf6679),
    onError: Color(0xff120a0c),
    errorContainer: Color(0xffb1384e),
    onErrorContainer: Color(0xfffbeaed),
    background: Color(0xff1a1415),
    onBackground: Color(0xffe6e6e6),
    surface: Color(0xff181414),
    onSurface: Color(0xffeeeeee),
    surfaceVariant: Color(0xff3e3537),
    onSurfaceVariant: Color(0xffe3e2e2),
    outline: Color(0xff737373),
    outlineVariant: Color(0xff272727),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xfffef9fa),
    onInverseSurface: Color(0xff111111),
    inversePrimary: Color(0xff6e3a42),
    surfaceTint: Color(0xffe4677c),
  );
}
