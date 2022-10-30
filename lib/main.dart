import 'package:astrology_app/Providers/theme_provider.dart';
import 'package:astrology_app/views/home_screen.dart';
import 'package:astrology_app/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
    providers: [ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider())],
    builder: (context, _) {
      return MaterialApp(
        initialRoute: 'splash',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: (Provider.of<ThemeProvider>(context).isDark == false)
            ? ThemeMode.light
            : ThemeMode.dark,
        routes: {
          '/': (context) => Home_Screen(),
          'splash': (context) => const Splash_Screen(),
        },
      );
    },
  )
  );
}
