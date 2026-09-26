import 'package:flutter/material.dart';

class ImagemProduto extends StatelessWidget {
  final String fonte;
  final String categoria;
  final BoxFit fit;

  const ImagemProduto({
    super.key,
    required this.fonte,
    required this.categoria,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    if (fonte.startsWith('http://') || fonte.startsWith('https://')) {
      return Image.network(
        fonte,
        fit: fit,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (_, __, ___) => _fallbackImage(),
      );
    }

    if (fonte.startsWith('assets/')) {
      return Image.asset(
        fonte,
        fit: fit,
        errorBuilder: (_, __, ___) => _fallbackImage(),
      );
    }

    return _fallbackImage();
  }

  Widget _fallbackImage() {
    final icon = categoria == 'Cartas'
        ? Icons.catching_pokemon
        : categoria == 'Action Figures'
            ? Icons.accessibility_new
            : Icons.gamepad;

    return Center(
      child: Icon(icon, color: Colors.blueAccent.shade400, size: 56),
    );
  }
}
