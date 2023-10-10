import 'package:flutter/material.dart';
import 'package:fruit_e_commerce/core/app_colors.dart';

final ThemeData appTheme = ThemeData(
  appBarTheme: const AppBarTheme(backgroundColor: AppColors.primaryColor, elevation: 0.8),
  brightness: Brightness.light,
  primaryColor: AppColors.primaryColor,
  colorScheme: const ColorScheme.light(primary: AppColors.primaryColor),
);
