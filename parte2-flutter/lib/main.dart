import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() => runApp(const AcervoPixelApp());

class AcervoPixelApp extends StatelessWidget {
  const AcervoPixelApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'Acervo Pixel',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true),
      home: const HomePage());
}
