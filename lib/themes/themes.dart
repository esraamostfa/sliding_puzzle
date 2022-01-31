import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    appBarTheme: const AppBarTheme(
        titleSpacing: 21,
        color: Colors.blue,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 21.0,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(
            color: Colors.white,
            size: 35,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        )
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      elevation: 21,
    ),
    scaffoldBackgroundColor: Colors.blueGrey[100],
    textTheme: const TextTheme(bodyText1: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ))
);