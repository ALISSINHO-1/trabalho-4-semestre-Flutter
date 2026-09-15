import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'screens/splash_page.dart';

void main() {
 
  runApp(const PlayRetroApp());
}

class PlayRetroApp extends StatelessWidget {
  const PlayRetroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrô Games',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090E17), 
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF161B22),
          centerTitle: true,
        ),
        colorScheme: ColorScheme.dark(
          primary: Colors.blueAccent,
          secondary: Colors.blueAccent.shade700,
        ),
      ),
      
      // Dizemos que a tela inicial agora é a SplashPage
      home: const SplashPage(), 
    );
  }
}