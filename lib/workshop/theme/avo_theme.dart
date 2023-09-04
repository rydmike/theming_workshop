import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'avo_scheme.dart';
import 'theme_settings.dart';
import 'used_theme.dart';

/// The AvoTheme is the application theme design for AvoDelish app.
class AvoTheme {
  AvoTheme._();
  // Select the used theme, based on theme settings and brightness.
  static ThemeData use(Brightness brightness, ThemeSettings settings) {
    final bool isLight = brightness == Brightness.light;
    switch (settings.usedTheme) {
      case UsedTheme.fromSeed:
        return isLight
            ? from(AvoScheme.seedLight, settings)
            : from(AvoScheme.seedDark, settings);
      case UsedTheme.fromThemeBuilder:
        return isLight
            ? from(AvoScheme.mtbLight, settings)
            : from(AvoScheme.mtbDark, settings);
      case UsedTheme.fromSeedOverrides:
        return isLight
            ? from(AvoScheme.seedOverrideLight, settings)
            : from(AvoScheme.seedOverrideDark, settings);
      case UsedTheme.fromSeeds:
        return isLight
            ? from(AvoScheme.seedsLight, settings)
            : from(AvoScheme.seedsDark, settings);
      case UsedTheme.fromSeedsOverrides:
        return isLight
            ? from(AvoScheme.seedsOverrideLight, settings)
            : from(AvoScheme.seedsOverrideDark, settings);
      case UsedTheme.redWine:
        return isLight
            ? from(AvoScheme.wineBarLight, settings)
            : from(AvoScheme.wineBarDark, settings);
      case UsedTheme.fromFCS:
        return isLight ? flexLight(settings) : flexDark(settings);
      case UsedTheme.adaptiveFCS:
        return isLight
            ? flexAdaptiveLight(settings)
            : flexAdaptiveDark(settings);
    }
  }

  // 1) A ThemeData function where we can build our app theme.
  static ThemeData from(ColorScheme scheme, ThemeSettings settings) {
    // Convenience for light and dark mode.
    final bool isLight = scheme.brightness == Brightness.light;

    // 1) Add fixed visual density
    // For same size and proportions on desktop as we will see on mobile.
    const VisualDensity visualDensity = VisualDensity.standard;

    // Let's make a ThemeData object.
    return ThemeData(
      useMaterial3: settings.useMaterial3,
      colorScheme: scheme,

      // 1) Add fixed visual density
      visualDensity: visualDensity,

      // 2) Consider using M3 Typography even if you use M2 mode.
      typography: Typography.material2021(
        platform: defaultTargetPlatform,
        colorScheme: scheme,
      ),

      // 3) Fix the legacy divider color.
      dividerColor: scheme.outlineVariant,
      // 4) Fix legacy primary colors.
      primaryColor: scheme.primary,
      primaryColorDark: isLight ? scheme.secondary : scheme.onPrimary,
      primaryColorLight: isLight ? scheme.secondaryContainer : scheme.secondary,
      secondaryHeaderColor:
          isLight ? scheme.primaryContainer : scheme.secondaryContainer,

      // 5) Fix legacy surface colors.

      // Component themes
      //
      // 6) AppBar
      appBarTheme: AppBarTheme(),
      //
      // 7) ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(),

      // 8) Custom radius on other buttons buttons
      filledButtonTheme: FilledButtonThemeData(),
      outlinedButtonTheme: OutlinedButtonThemeData(),
      textButtonTheme: TextButtonThemeData(),

      // 9) ToggleButtons Theme
      toggleButtonsTheme: ToggleButtonsThemeData(),

      // 10) FloatingActionButton or the FAB.
      floatingActionButtonTheme: FloatingActionButtonThemeData(),

      // 11) ChipTheme
      chipTheme: ChipThemeData(),

      // 12) Switch, make thumb size fixed!
      switchTheme: SwitchThemeData(),

      // 13) More custom Switch, even more iOS like.
      // switchTheme: switchTheme(scheme),

      // 14) Input decorator
      // Input decorator is one of the more confusing components to theme.
      inputDecorationTheme: inputTheme(scheme),

      // 15) The old button theme still has some usage, like aligning the
      // DropdownButton and DropdownButtonFormField to their parent.
      buttonTheme: const ButtonThemeData(),

      // 16) Dropdown menu theme
      dropdownMenuTheme: DropdownMenuThemeData(),

      // 17) Time picker should have a dial background color.
      timePickerTheme: TimePickerThemeData(),

      // 18) Custom date picker style.
      datePickerTheme: DatePickerThemeData(),

      // 19) Add a custom TextTheme with GoogleFonts.nnnTextTheme
      textTheme: googleFontsTextTheme,
      primaryTextTheme: googleFontsTextTheme,

      // 20) Add a custom TextTheme made from TextStyles
      // textTheme: textThemeFromStyles,

      // 21a) Add the app bar the style in the AppBarTheme in step 6) above.
      // 21b and c) Add content text themes

      // 22) Add all our custom theme extensions.
      extensions: <ThemeExtension<dynamic>>{},
    );
  }

  // 13) A custom SwitchTheme that resembles an iOS Switch.
  // The intention is that feels familiar on iOS and still also OK on Android.
  static SwitchThemeData switchTheme(ColorScheme scheme) {
    final bool isLight = scheme.brightness == Brightness.light;
    return SwitchThemeData();
  }

  // 14) A custom input decoration theme.
  // You may need the input decoration theme in other components too,
  // good to defined separately so you can re-use its definition.
  static InputDecorationTheme inputTheme(ColorScheme scheme) {
    final bool isLight = scheme.brightness == Brightness.light;
    return InputDecorationTheme();
  }

  // 19) Get our custom GoogleFonts TextTheme: poppins
  // Issue: https://github.com/material-foundation/flutter-packages/issues/401
  static TextTheme get googleFontsTextTheme {
    // Add ".fixColors"
    return TextTheme();
  }

  // 20) Make a TextTheme from TextStyles to customize more.
  // There is no color issue with GoogleFonts then since TextStyles
  // have null color by default.
  static TextTheme get textThemeFromStyles {
    return TextTheme();
  }

  // 21a) Make a totally custom text style for a component theme: AppBar
  static TextStyle appBarTextStyle(ColorScheme scheme) {
    return TextStyle();
  }

  // 21b) A "semantic" text theme that will use for content, not SDK widgets.
  static TextStyle blogHeader(ColorScheme scheme) {
    return TextStyle();
  }

  // 22c) A "semantic" text style that will use for content, not SDK widgets.
  static TextStyle blogBody(ColorScheme scheme) {
    return TextStyle();
  }

  // 23) Light: Entire theme made with ThemesPlayground.
  static ThemeData flexLight(ThemeSettings settings) {
    final ThemeData theme = FlexThemeData.light(
      useMaterial3: settings.useMaterial3,
    );
    // Grab the AppBarTheme from the theme we have.
    final AppBarTheme appBarTheme = theme.appBarTheme;
    // Add the things we could not make in the Playground.
    // AppBar theme with the custom font and unusual foreground color.
    // The switch theme we can totally replace with out custom theme.
    // Plus the custom theme extensions.
    return theme.copyWith();
  }

  // 23) Dark: Entire theme made with ThemesPlayground.
  static ThemeData flexDark(ThemeSettings settings) {
    final ThemeData theme = FlexThemeData.dark(
      useMaterial3: settings.useMaterial3,
    );
    // Grab the AppBarTheme and Chip Theme from the theme we have.
    final AppBarTheme appBarTheme = theme.appBarTheme;
    final ChipThemeData chipTheme = theme.chipTheme;
    // Add the things we could not make in the Playground.
    return theme.copyWith();
  }

  // 24) Light: Entire theme made with ThemesPlayground - Platform adaptive
  static ThemeData flexAdaptiveLight(ThemeSettings settings) {
    final ThemeData theme = FlexThemeData.light(
      useMaterial3: settings.useMaterial3,
    );
    // Grab the AppBarTheme and Chip Theme from the theme we have.
    final AppBarTheme appBarTheme = theme.appBarTheme;
    final ChipThemeData chipTheme = theme.chipTheme;
    // Add the things we could not make in the Playground.
    return theme.copyWith();
  }

  // 24) Dark: Entire theme made with ThemesPlayground - Platform adaptive
  static ThemeData flexAdaptiveDark(ThemeSettings settings) {
    final ThemeData theme = FlexThemeData.dark(
      useMaterial3: settings.useMaterial3,
    );
    // Grab the AppBarTheme and Chip Theme from the theme we have.
    final AppBarTheme appBarTheme = theme.appBarTheme;
    final ChipThemeData chipTheme = theme.chipTheme;
    // Add the things we could not make in the Playground.
    return theme.copyWith();
  }
}
