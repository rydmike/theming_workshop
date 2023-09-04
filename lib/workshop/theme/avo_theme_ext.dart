import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

import 'avo_theme.dart';
import 'avo_tokens.dart';

/// A theme extension for semantic colors and content text styles.
class AvoThemeExt extends ThemeExtension<AvoThemeExt> {
  const AvoThemeExt({
    required this.received,
    required this.onReceived,
    required this.making,
    required this.onMaking,
    required this.inDelivery,
    required this.onInDelivery,
    required this.delivered,
    required this.onDelivered,
    this.blogHeader,
    this.blogBody,
  });

  final Color? received;
  final Color? onReceived;
  final Color? making;
  final Color? onMaking;
  final Color? inDelivery;
  final Color? onInDelivery;
  final Color? delivered;
  final Color? onDelivered;
  final TextStyle? blogHeader;
  final TextStyle? blogBody;

  // Fallback color value that is used for all colors in both theme modes.
  // This should never be seen when AvoThemeExt is setup correctly.
  static const int _fail = 0xFF1565C0; // Bright dark blue

  // You must override the copyWith method.
  @override
  AvoThemeExt copyWith({
    Color? received,
    Color? onReceived,
    Color? making,
    Color? onMaking,
    Color? inDelivery,
    Color? onInDelivery,
    Color? delivered,
    Color? onDelivered,
    TextStyle? blogHeader,
    TextStyle? blogBody,
  }) =>
      AvoThemeExt(
        received: received ?? this.received,
        onReceived: onReceived ?? this.onReceived,
        making: making ?? this.making,
        onMaking: onMaking ?? this.onMaking,
        inDelivery: inDelivery ?? this.inDelivery,
        onInDelivery: onInDelivery ?? this.onInDelivery,
        delivered: delivered ?? this.delivered,
        onDelivered: onDelivered ?? this.onDelivered,
        blogHeader: blogHeader ?? this.blogHeader,
        blogBody: blogBody ?? this.blogBody,
      );

  // You must override the lerp method.
  @override
  AvoThemeExt lerp(ThemeExtension<AvoThemeExt>? other, double t) {
    if (other is! AvoThemeExt) {
      return this;
    }
    return AvoThemeExt(
      received: Color.lerp(received, other.received, t),
      onReceived: Color.lerp(onReceived, other.onReceived, t),
      making: Color.lerp(making, other.making, t),
      onMaking: Color.lerp(onMaking, other.onMaking, t),
      inDelivery: Color.lerp(inDelivery, other.inDelivery, t),
      onInDelivery: Color.lerp(onInDelivery, other.onInDelivery, t),
      delivered: Color.lerp(delivered, other.delivered, t),
      onDelivered: Color.lerp(onDelivered, other.onDelivered, t),
      blogHeader: TextStyle.lerp(blogHeader, other.blogHeader, t),
      blogBody: TextStyle.lerp(blogBody, other.blogBody, t),
    );
  }

  // Custom const theme with our brand color in light mode.
  static const AvoThemeExt light = AvoThemeExt(
    received: AvoTokens.receivedLight,
    onReceived: AvoTokens.receivedDark,
    making: AvoTokens.preparingLight,
    onMaking: AvoTokens.preparingDark,
    inDelivery: AvoTokens.deliveryLight,
    onInDelivery: AvoTokens.deliveryDark,
    delivered: AvoTokens.deliveredLight,
    onDelivered: AvoTokens.deliveredDark,
  );

// Custom const theme with our brand color in dark mode.
  static const AvoThemeExt dark = AvoThemeExt(
    received: AvoTokens.receivedDark,
    onReceived: AvoTokens.receivedLight,
    making: AvoTokens.preparingDark,
    onMaking: AvoTokens.preparingLight,
    inDelivery: AvoTokens.deliveryDark,
    onInDelivery: AvoTokens.deliveryLight,
    delivered: AvoTokens.deliveredDark,
    onDelivered: AvoTokens.deliveredLight,
  );

  /// A factory to return the light or dark extended theme with its custom
  // colors harmonized.
  factory AvoThemeExt.make(ColorScheme scheme) {
    if (scheme.brightness == Brightness.light) {
      return light
          .copyWith(
            blogHeader: AvoTheme.blogHeader(scheme),
            blogBody: AvoTheme.blogBody(scheme),
          )
          .harmonized(scheme.primary);
    } else {
      return dark
          .copyWith(
            blogHeader: AvoTheme.blogHeader(scheme),
            blogBody: AvoTheme.blogBody(scheme),
          )
          .harmonized(scheme.primary);
    }
  }

  /// A AvoThemeExt, where all its colors are harmonized towards a
  /// given [sourceColor], typically the theme's colors scheme primary color.
  AvoThemeExt harmonized(Color sourceColor) {
    final int source = sourceColor.value;
    return copyWith(
      received: Color(Blend.harmonize(received?.value ?? _fail, source)),
      onReceived: Color(Blend.harmonize(onReceived?.value ?? _fail, source)),
      making: Color(Blend.harmonize(making?.value ?? _fail, source)),
      onMaking: Color(Blend.harmonize(onMaking?.value ?? _fail, source)),
      inDelivery: Color(Blend.harmonize(inDelivery?.value ?? _fail, source)),
      onInDelivery:
          Color(Blend.harmonize(onInDelivery?.value ?? _fail, source)),
      delivered: Color(Blend.harmonize(delivered?.value ?? _fail, source)),
      onDelivered: Color(Blend.harmonize(onDelivered?.value ?? _fail, source)),
    );
  }
}
