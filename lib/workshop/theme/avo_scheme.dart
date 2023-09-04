import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

import 'avo_tokens.dart';

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
  static const mtbLight = ColorScheme.light();
  static const mtbDark = ColorScheme.dark();

  /// 3) M3 seed generated scheme, with main brand color locked in.
  static final ColorScheme seedOverrideLight = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: const Color(0xFF6750A4),
    // Color overrides to token values
  );
  static final ColorScheme seedOverrideDark = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color(0xFF6750A4),
    // Color overrides to token values
  );

  /// 4) FlexSeedScheme, more options in seed results and you can customize it.
  /// You can use 6 seed keys instead of only 1, one for each
  /// tonal palette
  static final ColorScheme seedsLight = SeedColorScheme.fromSeeds(
    brightness: Brightness.light,
    primaryKey: const Color(0xFF6750A4),
    tones: FlexTones.material(Brightness.light),
    // Color overrides to token values
  );
  static final ColorScheme seedsDark = SeedColorScheme.fromSeeds(
    brightness: Brightness.dark,
    primaryKey: const Color(0xFF6750A4),
    tones: FlexTones.material(Brightness.dark),
    // Color overrides to token values
  );

  /// 5) FlexSeedScheme, more options in seed results and you can customize it.
  /// You can use 6 seed keys instead of only 1, one for each
  /// tonal palette
  static final ColorScheme seedsOverrideLight = SeedColorScheme.fromSeeds(
    brightness: Brightness.light,
    primaryKey: const Color(0xFF6750A4),
    tones: FlexTones.chroma(Brightness.light),
    // Color overrides to token values
  );
  static final ColorScheme seedsOverrideDark = SeedColorScheme.fromSeeds(
    brightness: Brightness.dark,
    primaryKey: const Color(0xFF6750A4),
    tones: FlexTones.chroma(Brightness.dark),
    // Color overrides to token values
  );

  /// 6) A second theme for the red red wine bar...
  static const ColorScheme wineBarLight = ColorScheme.light();
  static const ColorScheme wineBarDark = ColorScheme.dark();
}
