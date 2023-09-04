import 'package:flutter/material.dart';

/// An enum used to model our order status state, labels, icons and colors.
enum UsedTheme {
  fromSeed(
    label: 'From Seed',
    icon: Icons.filter_1,
  ),
  fromThemeBuilder(
    label: 'From M3 theme builder',
    icon: Icons.filter_2,
  ),
  fromSeedOverrides(
    label: 'From Seed+overrides',
    icon: Icons.filter_3,
  ),
  fromSeeds(
    label: 'From Seeds (FSS)',
    icon: Icons.filter_4,
  ),
  fromSeedsOverrides(
    label: 'From Seeds+overrides (FSS)',
    icon: Icons.filter_5,
  ),
  redWine(
    label: 'Red red wine (FCS)',
    icon: Icons.filter_6,
  ),
  fromFCS(
    label: 'From Playground (FCS)',
    icon: Icons.filter_7,
  ),
  adaptiveFCS(
    label: 'Adaptive Playground (FCS)',
    icon: Icons.filter_8,
  );

  const UsedTheme({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}
