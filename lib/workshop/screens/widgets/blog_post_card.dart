import 'package:flutter/material.dart';

import '../../../shared/widgets/universal/stateful_header_card.dart';
import '../../theme/avo_theme_ext.dart';

class BlogPostCard extends StatelessWidget {
  const BlogPostCard({super.key});

  static const String _blogText = '''
Google’s new Material 3 design is a design system that aims to create beautiful and expressive themes that reflect the user’s personal preferences and context. Material 3 design introduces new features and tools that enable designers and developers to customize the appearance and behavior of their apps, such as color, typography, shape, motion, and dark theme1.

One of the main features of Material 3 design is the dynamic color system, which allows apps to generate color palettes based on the user’s wallpaper, system settings, or custom inputs. The color system also adapts to different lighting conditions and modes, such as dark theme or high contrast mode1. This way, apps can create themes that are more harmonious, vibrant, and personal for each user.

Another feature of Material 3 design is the new component library, which provides a set of flexible and adaptable components that can be used across different platforms and devices. The components are designed to support various types of interactions, such as touch, mouse, keyboard, and voice. The components also follow the principles of Material Design, such as responsiveness, clarity, and consistency2.

Material 3 design also offers new tools and resources for designers and developers to learn and apply the design system in their projects. For example, the Material Design Kit provides a comprehensive introduction to the design system, with styles and components to help users get started3. The Material Design website also provides documentation, guidelines, tutorials, and examples to help users understand and implement the design system1.

In summary, Google’s new Material 3 design is a design system that makes themes that are beautiful and very color expressive by allowing users to customize their apps according to their personal preferences and context. Material 3 design also provides new features and tools that help designers and developers create high quality digital experiences.
''';

  @override
  Widget build(BuildContext context) {
    return StatefulHeaderCard(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      isOpen: false,
      leading: const Icon(Icons.text_snippet_outlined),
      title: const Text('Blog post'),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Expressive Material 3',
                style: Theme.of(context).extension<AvoThemeExt>()?.blogHeader),
            Text(_blogText,
                style: Theme.of(context).extension<AvoThemeExt>()?.blogBody),
          ],
        ),
      ),
    );
  }
}
