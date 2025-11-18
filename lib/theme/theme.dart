import 'package:flutter/material.dart';

final darkTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue[300]!,
        ), //Цветовая схема на основе желтого цвета для хедера
        useMaterial3: true,
        brightness: Brightness.light, //Светлая тема
        scaffoldBackgroundColor: const Color.fromARGB(
          255,
          33,
          33,
          33,
        ), //Цвет фона приложения
        textTheme: TextTheme(
          //Тема текста
          bodyLarge: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          labelSmall: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        dividerTheme: const DividerThemeData(
          color: Colors.white24,
          thickness: 1,
        ), //Тема для разделителей
        listTileTheme: ListTileThemeData(
          iconColor: Colors.white70,
        ), //Тема для иконок в ListTile
      );