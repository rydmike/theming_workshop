import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Static App color schemes used in examples 4 & 5.
///
/// Putting static const color data in their own class with only color values
/// and data related to the colors is a common useful and convenient practice.
class AppColor {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppColor._();

  // Create a custom flex scheme color for a light theme.
  static const FlexSchemeColor _myScheme1Light = FlexSchemeColor(
    primary: Color(0xFF00296B),
    primaryContainer: Color(0xFFA0C2ED),
    secondary: Color(0xFFD26900),
    secondaryContainer: Color(0xFFFFD270),
    tertiary: Color(0xFF5C5C95),
    tertiaryContainer: Color(0xFFC8DBF8),
    // The built in schemes use their tertiary color as their default
    // custom app bar color, but it can be any color. We use a custom color
    // here. We will see this in example 5 when using the theme and selecting
    // the custom app bar style. We use a light blue that matches branded
    // surface colors, but is a bit stronger than most surface branding.
    appBarColor: Color(0xFFC8DCF8),
    swapOnMaterial3: true,
  );
// Create a corresponding custom flex scheme color for a dark theme.
  static const FlexSchemeColor _myScheme1Dark = FlexSchemeColor(
    primary: Color(0xFFB1CFF5),
    primaryContainer: Color(0xFF3873BA),
    secondary: Color(0xFFFFD270),
    secondaryContainer: Color(0xFFD26900),
    tertiary: Color(0xFFC9CBFC),
    tertiaryContainer: Color(0xFF535393),
    // A custom very dark blue, to match the dark theme mode
    appBarColor: Color(0xFF00102B),
    swapOnMaterial3: true,
  );

  // We can build a scheme the long way, by specifying all the required
  // scheme colors, like above, or we can also build schemes from a single
  // primary color. With the `FlexSchemeColor.from` factory. When doing so the
  // only required color is the primary color, the other colors will be
  // computed. We can optionally also provide the `primaryContainer`,
  // `secondary` and `secondaryContainer` colors with the factory, but any
  // color that is not provided will always be computed to get all the required
  // colors in a `FlexSchemeColor`.

  // In this example we create our 2nd scheme from just a primary color for the
  // light and dark schemes. The custom `appBarColor` does in this case also
  // receive the same color value as the one that is computed for
  // `secondaryContainer` color. This is its default with the
  // `FlexSchemeColor.from` factory if the color is not specified.

  // When you figure out the actual colors you want, it might be a good idea to
  // use the method in the above case for the custom _myScheme1Light and dark,
  // since that can be const and you can then make your entire list
  // of color schemes a const.

  // The `brightness` parameter in the `FlexSchemeColor.from` factory is new
  // in version 5. If `brightness` is specified the factory computes missing
  // colors that are well suited for a Material 3 based ColorScheme, of the
  // given brightness. If brightness is not specified, then the algorithm is
  // same as before version 5, but with two more colors. Its produced colors
  // fit better for M2 specification, they do also work in M3, they just don't
  // follow the guidelines with respect to the hue of the main color and its
  // container pair color. When using the `FlexSchemeColor.from` with
  // Material 3 `ColorScheme`, prefer specifying the brightness value for
  // results following the Material 3 design intent.
  static final FlexSchemeColor _myScheme2Light = FlexSchemeColor.from(
    primary: const Color(0xFF065808),
    brightness: Brightness.light,
  );
  static final FlexSchemeColor _myScheme2Dark = FlexSchemeColor.from(
    primary: const Color(0xFF629F80),
    brightness: Brightness.dark,
  );

  // For our 3rd custom scheme we will define primary and secondary colors, but
  // no container colors, we will not make any dark scheme definitions either.
  // All these missing colors will be computed, the missing color definitions
  // will get computed by the factory `FlexSchemeColor.from` when it creates the
  // `FlexSchemeColor` object. To make our dark colors for this light scheme, we
  // use the method `toDark` further below with the `_myScheme3Light` instance.
  //
  // Same comment as above, when you do figure out the actual colors you want,
  // it might be a good idea to use the method in the above case for the custom
  // _myScheme1Light and dark, since that can be const and you can then make
  // your entire list of color schemes a const.
  static final FlexSchemeColor _myScheme3Light = FlexSchemeColor.from(
    primary: const Color(0xFF1145A4),
    secondary: const Color(0xFFB61D1D),
    brightness: Brightness.light,
    swapOnMaterial3: true,
  );

  // These colors are used as default for the customizable colors in
  // example 5, the Themes Playground.
  static const Color customPrimaryLight = Color(0xFF004881);
  static const Color customPrimaryContainerLight = Color(0xFFD0E4FF);
  static const Color customSecondaryLight = Color(0xFFAC3306);
  static const Color customSecondaryContainerLight = Color(0xFFFFDBCF);
  static const Color customTertiaryLight = Color(0xFF006875);
  static const Color customTertiaryContainerLight = Color(0xFF95F0FF);

  static const Color customPrimaryDark = Color(0xFF9FC9FF);
  static const Color customPrimaryContainerDark = Color(0xFF00325B);
  static const Color customSecondaryDark = Color(0xFFFFB59D);
  static const Color customSecondaryContainerDark = Color(0xFF872100);
  static const Color customTertiaryDark = Color(0xFF86D2E1);
  static const Color customTertiaryContainerDark = Color(0xFF004E59);
}
