import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'used_theme.dart';

/// A Theme Settings class to bundle properties we want to modify on our
/// theme interactively.
@immutable
class ThemeSettings with Diagnosticable {
  final bool useMaterial3;
  final ThemeMode themeMode;
  final UsedTheme usedTheme;

  const ThemeSettings({
    required this.useMaterial3,
    required this.themeMode,
    required this.usedTheme,
  });

  /// Flutter debug properties override, includes toString.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('useMaterial3', useMaterial3));
    properties.add(EnumProperty<ThemeMode>('themeMode', themeMode));
    properties.add(EnumProperty<UsedTheme>('usedTheme', usedTheme));
  }

  /// Copy the object with one or more provided properties changed.
  ThemeSettings copyWith({
    bool? useMaterial3,
    ThemeMode? themeMode,
    UsedTheme? usedTheme,
  }) {
    return ThemeSettings(
      useMaterial3: useMaterial3 ?? this.useMaterial3,
      themeMode: themeMode ?? this.themeMode,
      usedTheme: usedTheme ?? this.usedTheme,
    );
  }

  /// Override the equality operator.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ThemeSettings &&
        other.useMaterial3 == useMaterial3 &&
        other.themeMode == themeMode &&
        other.usedTheme == usedTheme;
  }

  /// Override for hashcode.
  @override
  int get hashCode => Object.hashAll(<Object?>[
        useMaterial3.hashCode,
        themeMode.hashCode,
        usedTheme.hashCode,
      ]);
}
