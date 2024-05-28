import 'package:flutter/material.dart';
import 'package:tour_guide/core/app_pallet.dart';

class AppTheme {
  static final lightTheme = ThemeData().copyWith(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
    scaffoldBackgroundColor: AppPallet.scaffoldPrimaryColor,
    canvasColor: AppPallet.cardPrimaryColor,
    textTheme: const TextTheme().copyWith(
      titleLarge:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      titleMedium: const TextStyle(color: Colors.black),
      titleSmall: const TextStyle(color: Colors.black),
      bodyLarge: const TextStyle(color: Colors.black),
      bodyMedium: const TextStyle(color: Colors.black),
      bodySmall: const TextStyle(color: Colors.black),
    ),
    appBarTheme: const AppBarTheme()
        .copyWith(backgroundColor: AppPallet.scaffoldPrimaryColor),

    // Card Theme
    cardTheme: const CardTheme().copyWith(
        elevation: 8,
        surfaceTintColor: Colors.white,
        color: AppPallet.cardPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),

    // TextField Theme
    inputDecorationTheme: const InputDecorationTheme().copyWith(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    ),

    // Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppPallet.authButtonBackgroundColor,
        foregroundColor: AppPallet.authButtonForegroundColor,
        padding: const EdgeInsets.all(12),
      ),
    ),

    // List Tile
    listTileTheme: const ListTileThemeData().copyWith(
        textColor: AppPallet.textPrimaryColor,
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

    //  Text Button
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            textStyle: const TextStyle(decoration: TextDecoration.underline))),

    // Divider Theme.
    dividerTheme: const DividerThemeData()
        .copyWith(color: Colors.black, thickness: 2, indent: 12, endIndent: 12),

    // Filled Button
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.black.withAlpha(180),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
    ),
  );
}
