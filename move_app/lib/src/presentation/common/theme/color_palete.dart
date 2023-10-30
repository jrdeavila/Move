import 'package:flutter/material.dart';

abstract class ColorPalete {
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: colorScheme.background,
    colorScheme: colorScheme,
    appBarTheme: appBarTheme,
    inputDecorationTheme: inputDecorationTheme,
    timePickerTheme: timePickerTheme,
    datePickerTheme: datePickerTheme,
    useMaterial3: true,
  );

  // Configuracion de paleta de colores
  static const ColorScheme colorScheme = ColorScheme(
    primary: Color(0xFF226fc3),
    secondary: Color(0xFF74d1e9),
    tertiary: Color.fromARGB(255, 171, 252, 255),
    surface: Color.fromARGB(255, 119, 119, 119),
    background: Color.fromARGB(255, 253, 253, 253),
    error: Color.fromARGB(255, 207, 100, 100),
    onPrimary: Color.fromARGB(255, 245, 245, 245),
    onSecondary: Color.fromARGB(255, 54, 56, 56),
    onSurface: Color.fromARGB(255, 54, 188, 221),
    onBackground: Color.fromARGB(255, 214, 240, 245),
    onError: Color.fromARGB(255, 247, 247, 247),
    brightness: Brightness.dark,
  );

  // Configuracion de la barra superior
  static final AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: colorScheme.onPrimary,
    elevation: 0,
    titleTextStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Color.fromARGB(255, 54, 56, 56)),
  );

  // Configuracion de los inputs
  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: colorScheme.surface,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 20,
    ),
    hintStyle: const TextStyle(
      color: Color.fromARGB(255, 54, 56, 56),
    ),
  );

  static final TimePickerThemeData timePickerTheme = TimePickerThemeData(
    backgroundColor: colorScheme.background,
  );

  static final DatePickerThemeData datePickerTheme = DatePickerThemeData(
    backgroundColor: colorScheme.background,
  );
}
