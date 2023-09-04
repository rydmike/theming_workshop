import 'package:flutter/material.dart';

import 'used_theme.dart';

class UsedThemePopup extends StatelessWidget {
  const UsedThemePopup({
    super.key,
    required this.usedTheme,
    required this.onThemeChanged,
  });

  final UsedTheme usedTheme;
  final ValueChanged<UsedTheme> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Used theme'),
      subtitle: Text(usedTheme.label),
      trailing: PopupMenuButton<UsedTheme>(
        initialValue: usedTheme,
        icon: const Icon(Icons.more_vert),
        onSelected: onThemeChanged,
        itemBuilder: (BuildContext context) {
          return <PopupMenuItem<UsedTheme>>[
            for (final status in UsedTheme.values)
              PopupMenuItem<UsedTheme>(
                value: status,
                child: ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(status.icon),
                  title: Text(status.label),
                ),
              )
          ];
        },
      ),
    );
  }
}
