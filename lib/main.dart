import 'package:flutter/material.dart';

import 'workshop/screens/home_screen.dart';
import 'workshop/theme/avo_theme.dart';
import 'workshop/theme/theme_settings.dart';
import 'workshop/theme/used_theme.dart';

/// [AvoDelishApp] demonstrates the theme design for a fictive
/// company that sells mouth-watering salads and sandwiches with
/// avocado as the star ingredient.
void main() => runApp(const AvoDelishApp());

class AvoDelishApp extends StatefulWidget {
  const AvoDelishApp({super.key});

  @override
  State<AvoDelishApp> createState() => _AvoDelishAppState();
}

class _AvoDelishAppState extends State<AvoDelishApp> {
  ThemeSettings themeSettings = const ThemeSettings(
    useMaterial3: true,
    themeMode: ThemeMode.light,
    usedTheme: UsedTheme.fromSeed,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avocado Delish',
      theme: AvoTheme.use(Brightness.light, themeSettings),
      darkTheme: AvoTheme.use(Brightness.dark, themeSettings),
      themeMode: themeSettings.themeMode,
      home: HomePage(
        settings: themeSettings,
        onSettings: (ThemeSettings settings) {
          setState(() {
            themeSettings = settings;
          });
        },
      ),
    );
  }
}
