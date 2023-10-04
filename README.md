Readme

# Theming Workshop Flutter & Friends

This is the repo used at the Theming Workshop held September 5, 2023 in Stockholm at the Flutter'N Friends event.

## The Theming Mission

AvoDelish is a company that sells mouth-watering salads and sandwiches with avocado as the star ingredient


“AvoDelish, the delicious choice for health.”

**Your Flutter mission – Theme it!**

<img src="https://raw.githubusercontent.com/rydmike/theming_workshop/master/doc_images/avo-delish.png" alt="avo-delish"/>


The interesting files that we will be working with are:

* /theme/avo_tokens.dart
* /theme/avo_scheme.dart
* /theme/avo_theme.dart
* /theme/avo_theme_ext.dart


<img src="https://raw.githubusercontent.com/rydmike/theming_workshop/master/doc_images/avo-target.png" alt="avo-target"/>

## Workshop slides

[Slides for intro and talk part](https://docs.google.com/presentation/d/1a4_5Lm9plckURdqdZ-ogPYjk68tgO21C-HHHycA_ymA/edit?usp=sharing)

[Slides for theming teaser talk](https://docs.google.com/presentation/d/1EXXBUeKUXBMNXDHCkCNz-PsH_BsFzH2HEoQYQ3xkPZQ), a slight variation of the intro
part from the theming workshop. The intent of this talk was only in lightning talk awaken audience
to the wast possibilities of Material 3 design theming in Flutter.

## Workshop steps

Later I might write a full article about the steps involved in the theming workshop to explain
what was thought in the live workshop.

This repo contains a branch for each step used in the theming workshop that you can check build
and see the difference from each step.

### ColorScheme setup

The demo app contains eight different example themes. The first six differs only in how the used `ColorScheme` is defined.

1) M3 seed generated scheme, with the main brand color locked in.  
   Branch step: https://github.com/rydmike/theming_workshop/tree/01-scheme-step-1


2) Generated with M3 WEB theme builder  
   Branch step: https://github.com/rydmike/theming_workshop/tree/02-scheme-step-2


3) M3 seed generated scheme, with all token colors locked in.  
   Branch step: https://github.com/rydmike/theming_workshop/tree/03-scheme-step-3


4) FlexSeedScheme, seed from 3 colors, with the main brand color locked in. (Also used to demonstrate one hue!)  
   Branch step: https://github.com/rydmike/theming_workshop/tree/04-scheme-step-4


5) FlexSeedScheme, seed from 3 colors, with all token colors locked in.  
   Branch step: https://github.com/rydmike/theming_workshop/tree/05-scheme-step-5


6) A second theme for the Deli's red wine bar. This is completely different color scheme based theme. Used to illustrate ho to swap theme to completely different ColorScheme. In this demo the fictive use case is that deli want a different style for the menu and app in their wine bar and it uses the **Red Red Wine** the was extract from Themes Playground as a ColorScheme only.  
Branch step: https://github.com/rydmike/theming_workshop/tree/06-scheme-step-6


7) A theme made with ThemesPlayground that closely matches hand made version 5.
   This theme is added in a much later step in the workshop further below.


8) As theme 7, but with adaptive theme responses depending on the used platform.
   This theme is added in a much later step in the workshop further below.

### ThemeData Base Setup and Legacy Fixes

The demo app uses a simple function to select the used theme, based on theme settings and brightness.

1) A ThemeData function where we can build our app theme. We begin by only setting `VisualDensity` to a fixed choice.  
   Branch step: https://github.com/rydmike/theming_workshop/tree/07-theme-step-1

2) Consider using M3 Typography even if you use M2 mode, it just looks much better.  
   Branch step: https://github.com/rydmike/theming_workshop/tree/08-theme-step-2


3) Fix the legacy divider color.  
   Next, fix all legacy `ThemeData` colors. This is not so critical when using Material3 mode. However, it is still a good to define them all properly (=in a ColorScheme matching way), then if somebody uses the direct `ThemeData` colors in the app, it will look and be OK. Avoid using the `ThemeData` colors as they will all be deprecated eventually.  
   Branch step:  https://github.com/rydmike/theming_workshop/tree/09-theme-step-3


4) Fix legacy primary colors.  
   Branch step: https://github.com/rydmike/theming_workshop/tree/10-theme-step-4


5) Fix legacy surface colors.  
   Branch step: https://github.com/rydmike/theming_workshop/tree/11-theme-step-5


### ThemeData Component themes setup

In the next branch steps we define custom styles for a number of example component themes.

6) AppBar  
   Branch step: https://github.com/rydmike/theming_workshop/tree/12-theme-step-6


7) ElevatedButton  
   Branch step: https://github.com/rydmike/theming_workshop/tree/13-theme-step-7


8) Custom radius on other buttons  
   Branch step: https://github.com/rydmike/theming_workshop/tree/14-theme-step-8

9) ToggleButtons Theme  
   Branch step: https://github.com/rydmike/theming_workshop/tree/15-theme-step-9


10) FloatingActionButton  
    Branch step: https://github.com/rydmike/theming_workshop/tree/16-theme-step-10


11) ChipTheme  
    Branch step: https://github.com/rydmike/theming_workshop/tree/17-theme-step-11


12) Switch, make thumb size fixed!
    Branch step: https://github.com/rydmike/theming_workshop/tree/18-theme-step-12


13) A more advanced custom Switch theme, very iOS like.  
This component theme example shows have to make a Switch in Material3, that is very close in style to the iOS switch, if an iOS switch would be colored on widget level to use the custom primary color. The iOS switch cannot be themed, nor does the iOS version of the `Switch.adaptive` use primary color. Thus when using iOS Switch in a Material app, it must always use a wrapper setting widget color prop to `colorScheme.primary` to get the custom primary color, which is often desired. If not wrapped, it it is apple system green when it is an iOS Switch. By using the M3 iOS themed look alike style, we get a switch that is familiar on both Material and iOS and uses the theme color without any wrapper.  
Branch step: https://github.com/rydmike/theming_workshop/tree/19-theme-step-13


14) Input decorator. Making an input decorator theme is **VERY** tedious. This shows an advanced example of it using `MaterialStateOutlineInputBorder`.
    Branch step: https://github.com/rydmike/theming_workshop/tree/20-theme-step-14


15) The old button theme still has some usage, like aligning the DropdownButton and DropdownButtonFormField to their parent.
    Branch step: https://github.com/rydmike/theming_workshop/tree/21-theme-step-15


16) Dropdown menu theme. Use same `InputDecoratorTheme` as main one made for `TextField`, so the text field part of the `DropdownMenu` matches used txt input style. This is often desired.
    Branch step: https://github.com/rydmike/theming_workshop/tree/22-theme-step-16


17) Time picker should have a dial background color. (FIX Flutter SDK bug)
    Branch step: https://github.com/rydmike/theming_workshop/tree/23-theme-step-17


18) Custom date picker style.
    Branch step: https://github.com/rydmike/theming_workshop/tree/24-theme-step-18


19) Add a custom TextTheme with `GoogleFonts.nnnTextTheme`.
    Explain and demo issues with contrast of fonts with `GoogleFonts.nnnTextTheme` and show fix with extension. `.fixColors`.
    Branch step: https://github.com/rydmike/theming_workshop/tree/25-theme-step-19


20) Add a custom TextTheme made from TextStyles. For more flexibility when making a custom `TextTheme` define each `TextStyle` in it. To use different weights they must be explicitly defined to get correct font glyphs, if not defined, they just get an apprpximation that is incorrect. Same applies to italics.
    Branch step: https://github.com/rydmike/theming_workshop/tree/26-theme-step-20


21) Custom text styles
    Branch step: https://github.com/rydmike/theming_workshop/tree/27-theme-step-21
    Includes:
    21a) Make a totally custom text style for a component theme: AppBar
    21b) A "semantic" text theme that we will use for content, not SDK widgets.
    22c) A "semantic" text style that we will use for content, not SDK widgets.


22) Add the text styles a theme extensions:
    Branch step: https://github.com/rydmike/theming_workshop/tree/28-theme-step-22

### Themes Playground Theming

This part f the workshop demonstrates making the theme using the **Themes playground** instead.
The goal is to recreate the all the above theming things as close as possible using the **Themes Playground**.
At the same time it demonstrates that some parts cannot be made in the Playground, but we can add them with
the API and in some cases by using ThemeData.copyWith. The effort to make the above elaborate theme is still
significantly lower.

23) Entire theme made with ThemesPlayground.  
    Branch step: https://github.com/rydmike/theming_workshop/tree/29-themes-playground-23

    Tasks to do in the Playground in the workshop for this step.

- [ ] Add the colors! Copy from app! Light and dark! Only main colors!
- [ ] REMOVE blends
- [ ] USE M3 divider -> Going to keep!
- [ ] AppBar
    - [ ] Elevation scroll under light 0.5 dark 1
    - [ ] Surface color for M2! (not needed for M3)
    - [ ] Opacity light .97 dark .96
- [ ] Adaptive theme - shadows back - all
- [ ] Buttons
    - [ ] Elevated colors background primaryContainer, foreground onPrimaryContainer
    - [ ] All Material buttons - radius 10
    - [ ] Toggle buttons radius 10
    - [ ] FAB set to primaryContainer for M2, circular!
- [ ] Chips
    - [ ] Cannot replicate (use primary chip blend), radius top full
- [ ] Switch - thumb (and hover to onPrimary)
- [ ] Toggles - add selected is colored
- [ ] TextField
    - [ ] LIGHT Primary, opacity 6%, 0x10, Unfocused has border OFF, prefix icon primary
    - [ ] DARK set opacity to 15% 0x27s
- [ ] Popupmenu and dropdown - Set match button width option.
- [ ] Menus - Dropdown menu - already uses correct input decorator by default, just show it.
- [ ] Navigation bar
    - [ ] Has own legacy default - set to M3 to get same as we used in manual theme above.
    - [ ] Make custom with primary and onPrimary - nicer (imo)
- [ ] Dialogs
    - [ ] Time picker is OK
    - [ ] Date picker - header primary container
- [ ] FONTS? No fonts in Theme Playground, but we can can add them in API later.
- [ ] Visual density! - Standard
- [ ] Swap legacy -> Remove
- [ ] COPY-PASTE the code
    - [ ] Copy via text editor
    - [ ] Light
    - [ ] Dark
    - [ ] Paste in the custom styles we do not have in the Playground.

24) Entire theme made with ThemesPlayground - Platform adaptive  
    Branch step: https://github.com/rydmike/theming_workshop/tree/30-themes-playground-step-24

This part of the workshop changes the setup made in step 23 in the **Themes Playground** to a theme that is platform adaptive and looks a bit different on iOS, macOS and other desktops compared to Android.

- [ ] Platform adaptive themes
- [ ] What are platform adaptive themes?
- [ ] Remove custom radius, so we get defaults for none adaptive response
- [ ] Shape: Set adaptive radius to 10, and use it for desktop and iOS.
- [ ] Adaptive theme: Splash, density
- [ ] AppBar elevation tint - remove on desktop and iOS.
- [ ] Dialog desktop and iOS - 18?

25) Final result - Demo the adaptive theme result and differences on Android and iPhone.  
    Branch step: https://github.com/rydmike/theming_workshop/tree/31-done

