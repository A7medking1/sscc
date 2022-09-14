import 'package:flutter/material.dart';

ThemeData lightTheme() => ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0.0,
      color: Colors.white),
  backgroundColor: Colors.white,
);