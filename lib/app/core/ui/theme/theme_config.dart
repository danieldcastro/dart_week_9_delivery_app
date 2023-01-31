import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/app_styles.dart';
import '../styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();
  static final _defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(
        color: Colors.grey[400]!,
      ));

  static final theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    primaryColor: AppColors.instance.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.instance.primary,
      primary: AppColors.instance.primary,
      secondary: AppColors.instance.secondary,
    ),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: AppStyles.instance.primaryButton),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: TextStyles.instance.textRegular.copyWith(color: Colors.black),
      errorStyle:
          TextStyles.instance.textRegular.copyWith(color: Colors.redAccent),
    ),
  );
}
