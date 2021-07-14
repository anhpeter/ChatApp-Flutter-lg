import 'package:flutter/material.dart';

ThemeData lightTheme(context) {
  return ThemeData(
    primarySwatch: Colors.purple,
  );
}

ThemeData dartTheme(context) {
  return ThemeData.dark().copyWith();
}
