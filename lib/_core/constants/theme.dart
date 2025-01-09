import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    appBarTheme: appBarTheme(),
    useMaterial3: true,
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 23),
    centerTitle: true,
    backgroundColor: Colors.black,
    elevation: 0,
//    iconTheme: IconThemeData(color: Colors.white),
  );
}
