import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/const/app.dart';
import '../../shared/pages/subpage.dart';
import '../../shared/widgets/app/responsive_scaffold.dart';
import '../../shared/widgets/app/show_color_scheme_colors.dart';
import '../../shared/widgets/app/show_sub_theme_colors.dart';
import '../../shared/widgets/app/show_theme_data_colors.dart';
import '../../shared/widgets/universal/page_body.dart';
import '../../shared/widgets/universal/theme_mode_switch.dart';
import '../order_status/order_states_card.dart';
import '../theme/theme_settings.dart';
import '../theme/used_theme.dart';
import '../theme/used_theme_popup.dart';
import 'widgets/blog_post_card.dart';
import 'widgets/widget_cards.dart';

/// Home page for the theme workshop AvoDelish.
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.settings,
    required this.onSettings,
  });

  final ThemeSettings settings;
  final ValueChanged<ThemeSettings> onSettings;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController scrollController;
  // Enabled state of each menuItem.
  late List<bool> menuItemsEnabled;
  // Active state of each menuItem.
  late List<ResponsiveMenuItemIconState> menuItemsIconState;

  late List<Widget> content;

  @override
  void initState() {
    super.initState();
    scrollController =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0);
    // Set enabled menu items.
    menuItemsEnabled =
        List<bool>.generate(App.menuItems.length, (int i) => false);
    menuItemsEnabled[0] = true;
    menuItemsEnabled[1] = true;
    // Set menu icons states to initial states, some are a loaded from
    // persisted values via the theme controller.
    menuItemsIconState = List<ResponsiveMenuItemIconState>.generate(
        App.menuItems.length, (int i) => ResponsiveMenuItemIconState.primary);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    menuItemsIconState[0] = isLight
        ? ResponsiveMenuItemIconState.primary
        : ResponsiveMenuItemIconState.secondary;
    menuItemsIconState[1] = theme.useMaterial3
        ? ResponsiveMenuItemIconState.primary
        : ResponsiveMenuItemIconState.secondary;
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headingStyle = textTheme.headlineSmall!;
    final bool isDark = theme.brightness == Brightness.dark;
    // The widgets we want to show in a long list view
    content = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text('AvoDelish theme test bench',
            style: headingStyle.copyWith(color: theme.colorScheme.primary)),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'This is test app allows us to see the themed '
          'style of "all" Material widgets. ',
        ),
      ),
      const SizedBox(height: 8),
      ListTile(
        title: const Text('Theme mode'),
        subtitle: Text('Theme ${widget.settings.themeMode.name}'),
        trailing: ThemeModeSwitch(
          themeMode: widget.settings.themeMode,
          onChanged: (ThemeMode mode) {
            widget.onSettings(
              widget.settings.copyWith(themeMode: mode),
            );
          },
        ),
        onTap: () {
          if (isDark) {
            widget.onSettings(
              widget.settings.copyWith(themeMode: ThemeMode.light),
            );
          } else {
            widget.onSettings(
              widget.settings.copyWith(themeMode: ThemeMode.dark),
            );
          }
        },
      ),
      const SizedBox(height: 8),
      SwitchListTile(
        title: const Text('Use Material 3'),
        value: widget.settings.useMaterial3,
        onChanged: (bool value) {
          widget.onSettings(
            widget.settings.copyWith(useMaterial3: value),
          );
        },
      ),
      UsedThemePopup(
        usedTheme: widget.settings.usedTheme,
        onThemeChanged: (UsedTheme usedTheme) {
          widget.onSettings(
            widget.settings.copyWith(usedTheme: usedTheme),
          );
        },
      ),
      ListTile(
        title: const Text('Example page with all widgets'),
        subtitle: const Text('Uses active ColorScheme and Theme'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () async {
          await SubpageDemo.show(context);
        },
      ),
      // Custom widget token based style, no theme animation.
      const OrderStatesCard(useTheme: false),
      // Custom widget theme based style, has theme animation.
      const OrderStatesCard(useTheme: true),

      // Blog post card using custom theme extension fonts
      const BlogPostCard(),

      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: ShowColorSchemeColors(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: ShowThemeDataColors(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: ShowSubThemeColors(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: ButtonsSwitchesIconsShow(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: ToggleFabSwitchesChipsShow(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: TextInputFieldShow(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: AppTabBottomSearch(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: BottomNavigationBarsShow(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: NavigationRailShow(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: NavigationDrawerShow(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: DialogShow(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: BottomSheetSnackBannerShow(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: CardsShow(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: ListTileShow(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: TextThemeShow(),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: PrimaryTextThemeShow(),
      ),
    ];
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.sizeOf(context);
    final EdgeInsets mediaPadding = MediaQuery.paddingOf(context);
    final double margins = App.responsiveInsets(mediaSize.width);
    final double topPadding = mediaPadding.top + kToolbarHeight + margins;
    final double bottomPadding = mediaPadding.bottom + margins;
    final bool isPhone = mediaSize.width < App.phoneWidthBreakpoint ||
        mediaSize.height < App.phoneHeightBreakpoint;
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // FlexColorScheme contains a static helper that can be use to theme
      // the system navigation bar using an AnnotatedRegion. Without this
      // wrapper the system navigation bar in Android will not change
      // theme color as we change themes for the page. This is normal Flutter
      // behavior. By using an annotated region with the helper function
      // FlexColorScheme.themedSystemNavigationBar, we can make the
      // navigation bar follow desired background color and theme mode.
      // This looks much better and as it should on Android devices.
      // It also supports system navbar with opacity or fully transparent
      // Android system navigation bar on Android SDK >= 29.
      // Here we use transparent, it is often the best choice on modern phones.
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: FlexSystemNavBarStyle.transparent,
      ),
      child: ResponsiveScaffold(
        title: Text(App.title(context)),
        menuTitle: const Text(App.company),
        menuLeadingTitle: Text(
          App.title(context),
          style:
              theme.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
        ),
        menuLeadingSubtitle: const Text('Version ${App.versionMajor}'),
        menuLeadingAvatarLabel: 'AVO',
        menuItems: App.menuItems,
        menuItemsEnabled: menuItemsEnabled,
        menuItemsIconState: menuItemsIconState,
        railWidth: isPhone ? 52 : 66,
        breakpointShowFullMenu: App.desktopWidthBreakpoint,
        extendBodyBehindAppBar: true,
        extendBody: true,
        onSelect: (int index) {
          if (index == 0) {
            if (isDark) {
              widget.onSettings(
                widget.settings.copyWith(themeMode: ThemeMode.light),
              );
            } else {
              widget.onSettings(
                widget.settings.copyWith(themeMode: ThemeMode.dark),
              );
            }
          }
          if (index == 1) {
            if (widget.settings.useMaterial3) {
              widget.onSettings(
                widget.settings.copyWith(useMaterial3: false),
              );
            } else {
              widget.onSettings(
                widget.settings.copyWith(useMaterial3: true),
              );
            }
          }
        },
        body: PageBody(
          controller: scrollController,
          constraints: const BoxConstraints(maxWidth: App.maxBodyWidth),
          child: ListView.builder(
              controller: scrollController,
              padding: EdgeInsets.fromLTRB(0, topPadding, 0, bottomPadding),
              itemCount: content.length,
              itemBuilder: (BuildContext context, int index) {
                return content.elementAt(index);
              }),
        ),
      ),
    );
  }
}
