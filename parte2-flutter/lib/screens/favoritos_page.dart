import 'package:flutter/material.dart';

import '../models/favoritos.dart';
import '../models/item.dart';
import 'detalhe_page.dart';
import 'widgets/cartao.dart';

class FavoritosPage extends StatefulWidget {
  const FavoritosPage({super.key});

  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {
  @override
  Widget build(BuildContext context) {
    final itens = Favoritos().itens;

    return Scaffold(
      backgroundColor: const Color(0xFF01040A),
      appBar: AppBar(
        title: const Text('Favoritos'),
        backgroundColor: const Color(0xFF01040A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: itens.isEmpty ? _buildEmptyState() : _buildGrid(itens),
    );
  }

  Widget _buildGrid(List<Item> itens) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 210,
        mainAxisExtent: 300,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: itens.length,
      itemBuilder: (context, index) {
        final item = itens[index];
        return CartaoRetro(
          item: item,
          favoritado: true,
          onFavoriteToggle: () {
            setState(() => Favoritos().alternar(item));
          },
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => DetalhePage(item: item)),
            );
            if (mounted) setState(() {});
          },
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              color: Colors.blueAccent.shade200,
              size: 72,
            ),
            const SizedBox(height: 16),
            const Text(
              'Nenhum favorito ainda',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Toque no coração de um produto para guardá-lo aqui.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}
