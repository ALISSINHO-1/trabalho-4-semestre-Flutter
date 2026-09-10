import 'package:flutter/material.dart';

void main() {
  runApp(const PlayRetroApp());
}

class PlayRetroApp extends StatelessWidget {
  const PlayRetroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Play Retrô',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D1117), // Fundo escuro
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF161B22),
          centerTitle: true,
        ),
        colorScheme: ColorScheme.dark(
          primary: Colors.blueAccent,
          secondary: Colors.blueAccent.shade700,
        ),
      ),

    );  
  }
}