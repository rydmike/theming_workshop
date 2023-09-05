import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'avo_scheme.dart';
import 'avo_tokens.dart';
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
      canvasColor: scheme.background,
      cardColor: scheme.surface,
      scaffoldBackgroundColor: scheme.background,
      dialogBackgroundColor: scheme.surface,

      // Component themes
      //
      // 6) AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface.withOpacity(isLight ? 0.97 : 0.96),
        foregroundColor: scheme.secondary,
        elevation: 0,
        scrolledUnderElevation: isLight ? 0.2 : 2,
        shadowColor: scheme.shadow,
        shape: const RoundedRectangleBorder(),
      ),
      //
      // 7) ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primaryContainer,
          foregroundColor: scheme.onPrimaryContainer,
          shape: AvoTokens.outlineBorder,
        ),
      ),

      // 8) Custom radius on other buttons buttons
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: AvoTokens.outlineBorder,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: AvoTokens.outlineBorder,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          shape: AvoTokens.outlineBorder,
        ),
      ),

      // 9) ToggleButtons Theme
      toggleButtonsTheme: ToggleButtonsThemeData(
        borderWidth: AvoTokens.outlineWidth,
        selectedColor: scheme.onPrimary,
        color: scheme.primary,
        fillColor: scheme.primary,
        borderColor: scheme.outline,
        selectedBorderColor: scheme.primary,
        hoverColor: scheme.primary.withAlpha(0x14),
        focusColor: scheme.primary.withAlpha(0x1F),
        highlightColor: scheme.primary.withAlpha(0x14),
        splashColor: scheme.primary.withAlpha(0x1F),
        disabledColor: scheme.onSurface.withAlpha(0x61),
        disabledBorderColor: scheme.onSurface.withAlpha(0x1F),
        borderRadius: AvoTokens.borderRadius,
        constraints: BoxConstraints(
          minWidth: AvoTokens.buttonMinSize.width -
              AvoTokens.outlineWidth * 2 +
              visualDensity.baseSizeAdjustment.dx,
          minHeight: AvoTokens.buttonMinSize.height -
              AvoTokens.outlineWidth * 2 +
              visualDensity.baseSizeAdjustment.dy,
        ),
      ),

      // 10) FloatingActionButton or the FAB.
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primaryContainer,
        foregroundColor: scheme.onPrimaryContainer,
        shape: const StadiumBorder(),
      ),

      // 11) ChipTheme
      chipTheme: ChipThemeData(
        backgroundColor:
            isLight ? scheme.primaryContainer : scheme.outlineVariant,
        shape: const StadiumBorder(),
      ),

      // 12) Switch, make thumb size fixed!
      // switchTheme: SwitchThemeData(
      //   thumbIcon: MaterialStateProperty.resolveWith<Icon?>(
      //       (Set<MaterialState> states) {
      //     return const Icon(
      //       Icons.minimize,
      //       color: Colors.transparent,
      //     );
      //   }),
      // ),

      // 13) More custom Switch, even more iOS like.
      switchTheme: switchTheme(scheme),

      // 14) Input decorator
      // Input decorator is one of the more confusing components to theme.
      inputDecorationTheme: inputTheme(scheme),

      // 15) The old button theme still has some usage, like aligning the
      // DropdownButton and DropdownButtonFormField to their parent.
      buttonTheme: const ButtonThemeData(alignedDropdown: true),

      // 16) Dropdown menu theme
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: inputTheme(scheme),
      ),

      // 17) Time picker should have a dial background color.
      timePickerTheme: TimePickerThemeData(
        dialBackgroundColor: scheme.surfaceVariant,
      ),

      // 18) Custom date picker style.
      datePickerTheme: DatePickerThemeData(
        headerBackgroundColor: scheme.primaryContainer,
        headerForegroundColor: scheme.onPrimaryContainer,
        dividerColor: Colors.transparent,
      ),

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
    return SwitchThemeData(
      thumbIcon:
          MaterialStateProperty.resolveWith<Icon?>((Set<MaterialState> states) {
        return const Icon(Icons.minimize, color: Colors.transparent);
      }),
      trackOutlineColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        return Colors.transparent;
      }),
      trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          if (states.contains(MaterialState.selected)) {
            return scheme.primary.withOpacity(0.5);
          }
          return scheme.onSurface.withOpacity(0.07);
        }
        if (states.contains(MaterialState.selected)) {
          return scheme.primary;
        }
        return scheme.surfaceVariant;
      }),
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return isLight ? scheme.surface : scheme.onSurface.withOpacity(0.7);
        }
        return Colors.white;
      }),
    );
  }

  // 14) A custom input decoration theme.
  // You may need the input decoration theme in other components too,
  // good to defined separately so you can re-use its definition.
  static InputDecorationTheme inputTheme(ColorScheme scheme) {
    final bool isLight = scheme.brightness == Brightness.light;
    return InputDecorationTheme(
      filled: true,
      fillColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return scheme.onSurface.withOpacity(0.04);
        }
        return isLight
            ? scheme.primary.withOpacity(0.06)
            : scheme.primary.withOpacity(0.15);
      }),
      prefixIconColor:
          MaterialStateColor.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return scheme.onSurface.withOpacity(0.38);
        }
        if (states.contains(MaterialState.error)) {
          return scheme.error;
        }
        if (states.contains(MaterialState.focused)) {
          return scheme.primary;
        }
        return scheme.onSurfaceVariant;
      }),
      floatingLabelStyle:
          MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
        const TextStyle textStyle = TextStyle();
        if (states.contains(MaterialState.disabled)) {
          return textStyle.copyWith(color: scheme.onSurface.withOpacity(0.38));
        }
        if (states.contains(MaterialState.error)) {
          return textStyle.copyWith(color: scheme.error);
        }
        if (states.contains(MaterialState.hovered)) {
          return textStyle.copyWith(color: scheme.onSurfaceVariant);
        }
        if (states.contains(MaterialState.focused)) {
          return textStyle.copyWith(color: scheme.primary);
        }
        return textStyle.copyWith(color: scheme.onSurfaceVariant);
      }),
      border: MaterialStateOutlineInputBorder.resolveWith(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return const OutlineInputBorder(
            borderRadius: AvoTokens.borderRadius,
            borderSide: BorderSide.none,
          );
        }
        if (states.contains(MaterialState.error)) {
          if (states.contains(MaterialState.focused)) {
            return OutlineInputBorder(
              borderRadius: AvoTokens.borderRadius,
              borderSide: BorderSide(color: scheme.error, width: 2.0),
            );
          }
          return OutlineInputBorder(
            borderRadius: AvoTokens.borderRadius,
            borderSide: BorderSide(color: scheme.error),
          );
        }
        if (states.contains(MaterialState.focused)) {
          return OutlineInputBorder(
            borderRadius: AvoTokens.borderRadius,
            borderSide: BorderSide(color: scheme.primary, width: 2.0),
          );
        }
        if (states.contains(MaterialState.hovered)) {
          return const OutlineInputBorder(
            borderRadius: AvoTokens.borderRadius,
            borderSide: BorderSide.none,
          );
        }
        return const OutlineInputBorder(
          borderRadius: AvoTokens.borderRadius,
          borderSide: BorderSide.none,
        );
      }),
    );
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
