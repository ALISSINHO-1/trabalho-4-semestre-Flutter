import 'package:flutter/material.dart';

import '../../models/item.dart';

class CartaoRetro extends StatelessWidget {
  final Item item;
  final bool favoritado;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onTap;

  const CartaoRetro({
    super.key,
    required this.item,
    this.favoritado = false,
    this.onFavoriteToggle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 170,
        height: 290,
        child: Container(
          margin: const EdgeInsets.only(right: 16, bottom: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1424),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: _renderImage(),
                    ),
                    if (onFavoriteToggle != null)
                      Positioned(
                        top: 6,
                        right: 6,
                        child: Material(
                          color:
                              const Color(0xFF0D1424).withValues(alpha: 0.88),
                          shape: const CircleBorder(),
                          child: IconButton(
                            tooltip: favoritado
                                ? 'Remover dos favoritos'
                                : 'Adicionar aos favoritos',
                            visualDensity: VisualDensity.compact,
                            onPressed: onFavoriteToggle,
                            icon: Icon(
                              favoritado
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  favoritado ? Colors.redAccent : Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.categoria.toUpperCase(),
                        style: TextStyle(
                          color: Colors.blueAccent.shade200,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.nome,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'R\$ ${item.preco.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.shade400,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderImage() {
    if (item.imagem.startsWith('assets/')) {
      return Image.asset(
        item.imagem,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => _fallbackImage(),
      );
    }
    return _fallbackImage();
  }

  Widget _fallbackImage() {
    final icon = item.categoria == 'Cartas'
        ? Icons.catching_pokemon
        : item.categoria == 'Action Figures'
            ? Icons.accessibility_new
            : Icons.gamepad;
    return Center(
      child: Icon(icon, color: Colors.blueAccent.shade400, size: 56),
    );
  }
}
