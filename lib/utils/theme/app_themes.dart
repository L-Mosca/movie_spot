import 'package:flutter/material.dart';
import 'package:movie_spot/utils/theme/custom_themes/app_bar_theme.dart';
import 'package:movie_spot/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:movie_spot/utils/theme/custom_themes/check_box_theme.dart';
import 'package:movie_spot/utils/theme/custom_themes/chip_theme.dart';
import 'package:movie_spot/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:movie_spot/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:movie_spot/utils/theme/custom_themes/text_field_theme.dart';
import 'package:movie_spot/utils/theme/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MTextTheme.lightTextTheme,
    elevatedButtonTheme: MElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: MAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: MBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: MCheckBoxTheme.lightCheckBoxTheme,
    chipTheme: MChipTheme.lightChipTheme,
    outlinedButtonTheme: MOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: MTextFieldTheme.lightTextFieldTheme,
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: MTextTheme.darkTextTheme,
      elevatedButtonTheme: MElevatedButtonTheme.darkElevatedButtonTheme,
      appBarTheme: MAppBarTheme.darkAppBarTheme,
      bottomSheetTheme: MBottomSheetTheme.darkBottomSheetTheme,
      checkboxTheme: MCheckBoxTheme.darkCheckBoxTheme,
      chipTheme: MChipTheme.darkChipTheme,
      outlinedButtonTheme: MOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: MTextFieldTheme.darkTextFieldTheme);
}
