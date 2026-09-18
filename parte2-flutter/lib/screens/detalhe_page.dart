import 'package:flutter/material.dart';

import '../models/carrinho.dart';
import '../models/favoritos.dart';
import '../models/item.dart';
import '../models/item_especial.dart';

class DetalhePage extends StatefulWidget {
  final Item item;

  const DetalhePage({super.key, required this.item});

  @override
  State<DetalhePage> createState() => _DetalhePageState();
}

class _DetalhePageState extends State<DetalhePage> {
  int quantidade = 1;
  late String imagemEmDestaque;
  late List<String> galeriaDeImagens;

  @override
  void initState() {
    super.initState();
    imagemEmDestaque = widget.item.imagem;
    galeriaDeImagens = [widget.item.imagem, ...widget.item.galeria];
  }

  @override
  Widget build(BuildContext context) {
    final isEspecial = widget.item is ItemEspecial;
    final especial = isEspecial ? widget.item as ItemEspecial : null;
    final isFavorito = Favoritos().contem(widget.item);

    return Scaffold(
      backgroundColor: const Color(0xFF030B17),
      appBar: AppBar(
        backgroundColor: const Color(0xFF030B17),
        elevation: 0,
        title: Text(
          widget.item.nome,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            tooltip: isFavorito
                ? 'Remover dos favoritos'
                : 'Adicionar aos favoritos',
            icon: Icon(
              isFavorito ? Icons.favorite : Icons.favorite_border,
              color: isFavorito ? Colors.redAccent : Colors.white,
            ),
            onPressed: () {
              setState(() => Favoritos().alternar(widget.item));
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 800;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6,
                        child: _buildGaleriaDeImagens(alturaDestaque: 600),
                      ),
                      const SizedBox(width: 40),
                      Expanded(
                        flex: 5,
                        child: _buildProductDetails(isEspecial, especial),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildGaleriaDeImagens(alturaDestaque: 480),
                      const SizedBox(height: 24),
                      _buildProductDetails(isEspecial, especial),
                    ],
                  ),
          );
        },
      ),
    );
  }

  Widget _buildGaleriaDeImagens({required double alturaDestaque}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: alturaDestaque,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: _renderImage(imagemEmDestaque, BoxFit.contain),
          ),
        ),
        if (galeriaDeImagens.length > 1) ...[
          const SizedBox(height: 16),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: galeriaDeImagens.length,
              itemBuilder: (context, index) {
                final path = galeriaDeImagens[index];
                final isSelected = path == imagemEmDestaque;
                return GestureDetector(
                  onTap: () => setState(() => imagemEmDestaque = path),
                  child: Container(
                    width: 80,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected
                            ? Colors.blueAccent.shade400
                            : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: _renderImage(path, BoxFit.cover),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _renderImage(String path, BoxFit fit) {
    if (path.startsWith('assets/')) {
      return Image.asset(
        path,
        fit: fit,
        errorBuilder: (_, __, ___) => _fallbackImage(),
      );
    }
    return _fallbackImage();
  }

  Widget _buildProductDetails(bool isEspecial, ItemEspecial? especial) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.blueAccent.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            widget.item.categoria.toUpperCase(),
            style: TextStyle(
              color: Colors.blueAccent.shade200,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          widget.item.nome,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 16),
        _buildSpecRow('Fabricante', widget.item.fabricante),
        _buildSpecRow('Ano de lançamento', '${widget.item.anoLancamento}'),
        const SizedBox(height: 12),
        Text(
          'R\$ ${widget.item.preco.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent.shade400,
          ),
        ),
        const SizedBox(height: 16),
        const Divider(color: Colors.white24),
        const SizedBox(height: 16),
        const Text(
          'Sobre o produto',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.item.descricao,
          style:
              const TextStyle(color: Colors.white70, fontSize: 14, height: 1.6),
        ),
        if (isEspecial) ...[
          const SizedBox(height: 16),
          _buildSpecRow('Material', especial!.material),
          _buildSpecRow('Dimensões', especial.dimensoes),
        ],
        const SizedBox(height: 24),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF0D1424),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon:
                        const Icon(Icons.remove, color: Colors.white, size: 16),
                    onPressed: () {
                      if (quantidade > 1) setState(() => quantidade--);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      '$quantidade',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.white, size: 16),
                    onPressed: () => setState(() => quantidade++),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Carrinho().adicionar(widget.item, quantidade);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          '$quantidade x ${widget.item.nome} adicionado!',
                        ),
                        backgroundColor: Colors.blueAccent.shade700,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.shopping_bag_outlined,
                      color: Colors.white),
                  label: const Text(
                    'Adicionar ao carrinho',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSpecRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Wrap(
        spacing: 4,
        children: [
          Text(
            '$title:',
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white54, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _fallbackImage() {
    return const Center(
      child:
          Icon(Icons.image_not_supported, color: Colors.blueAccent, size: 50),
    );
  }
}
