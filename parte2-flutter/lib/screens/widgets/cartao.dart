import 'package:flutter/material.dart';
import '../../models/item.dart'; 

class CartaoRetro extends StatelessWidget {
  final Item item;

  const CartaoRetro({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170, 
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
         
         
          // --- ÁREA DA IMAGEM (Com fundo branco e respiro) ---
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0), 
              child: item.imagem.startsWith('http')
                  ? Image.network(item.imagem, fit: BoxFit.contain)
                  : Image.asset(item.imagem, fit: BoxFit.contain),
            ),
          ),
          

          // --- ÁREA DE TEXTOS E PREÇO ---
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
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
                  
                  // Nome do Produto
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
                  
                  // Rodapé do Cartão
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
                        padding: const EdgeInsets.all(6.0),
                        child: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}