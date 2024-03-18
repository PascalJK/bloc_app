import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'pages/home/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          bodyMedium: TextStyle(fontSize: 16),
        ),
        pageTransitionsTheme:
            const PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()}),
      ),
      home: const HomePage(),
    );
  }
}
