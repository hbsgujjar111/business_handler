import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../constants/colors.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/color_scheme_theme.dart';
import 'custom_themes/drawer_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/floating_action_button_theme.dart';
import 'custom_themes/icon_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/radio_theme.dart';
import 'custom_themes/slider_theme.dart';
import 'custom_themes/switch_theme.dart';
import 'custom_themes/text_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_selection_theme.dart';
import 'custom_themes/text_themes.dart';

class KAppTheme {
  KAppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: KColorSchemeTheme.lightColorSchemeTheme,
    primarySwatch: KColors.primarySwatch,
    primaryColor: KColors.primary,
    drawerTheme: KDrawerTheme.lightDrawerThemeData,
    scaffoldBackgroundColor: KColors.primarySwatch.shade50,
    appBarTheme: KAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: KBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: KCheckboxTheme.lightCheckboxTheme,
    switchTheme: KSwitchTheme.lightSwitchTheme,
    chipTheme: KChipTheme.lightChipTheme,
    sliderTheme: KSliderTheme.lightSliderThemeData,
    elevatedButtonTheme: KElevatedButtonTheme.lightElevatedButtonThemeData,
    outlinedButtonTheme: KOutlinedButtonTheme.lightOutlinedButtonThemeData,
    textButtonTheme: KTextButtonTheme.lightTextButtonThemeData,
    floatingActionButtonTheme: KFloatingActionButtonTheme.lightFloatingActionButtonTheme,
    textTheme: KTextTheme.lightTextTheme,
    inputDecorationTheme: KTextFormFieldTheme.lightInputDecorationTheme,
    textSelectionTheme: KTextSelectionTheme.lightTextSelectionTheme,
    radioTheme: KRadioTheme.lightRadioThemeData,
    iconTheme: KIconTheme.lightIconTheme,
    extensions: [
      SkeletonizerConfigData(
        effect: ShimmerEffect(
          baseColor: KColors.primarySwatch.shade200.withValues(alpha: .5),
          highlightColor: KColors.primarySwatch.shade300.withValues(alpha: .5),
        ),
      ),
    ],
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: KColorSchemeTheme.darkColorSchemeTheme,
    primarySwatch: KColors.primarySwatch,
    primaryColor: KColors.primary,
    drawerTheme: KDrawerTheme.darkDrawerThemeData,
    scaffoldBackgroundColor: KColors.scaffoldBg,
    appBarTheme: KAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: KBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: KCheckboxTheme.darkCheckboxTheme,
    switchTheme: KSwitchTheme.darkSwitchTheme,
    chipTheme: KChipTheme.darkChipTheme,
    sliderTheme: KSliderTheme.darkSliderThemeData,
    elevatedButtonTheme: KElevatedButtonTheme.darkElevatedButtonThemeData,
    outlinedButtonTheme: KOutlinedButtonTheme.darkOutlinedButtonThemeData,
    textButtonTheme: KTextButtonTheme.darkTextButtonThemeData,
    floatingActionButtonTheme: KFloatingActionButtonTheme.darkFloatingActionButtonTheme,
    textTheme: KTextTheme.darkTextTheme,
    inputDecorationTheme: KTextFormFieldTheme.darkInputDecorationTheme,
    textSelectionTheme: KTextSelectionTheme.darkTextSelectionTheme,
    radioTheme: KRadioTheme.darkRadioThemeData,
    iconTheme: KIconTheme.darkIconTheme,
    extensions: [
      SkeletonizerConfigData(
        effect: ShimmerEffect(
          baseColor: KColors.primarySwatch.shade200.withValues(alpha: .5),
          highlightColor: KColors.primarySwatch.shade300.withValues(alpha: .5),
        ),
      ),
    ],
  );
}
