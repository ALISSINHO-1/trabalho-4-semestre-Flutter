import 'package:flutter/material.dart';
import '../models/carrinho.dart';

class CarrinhoPage extends StatefulWidget {
  const CarrinhoPage({super.key});

  @override
  State<CarrinhoPage> createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {
  final Carrinho carrinho = Carrinho();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF030B17),
      appBar: AppBar(
        backgroundColor: const Color(0xFF030B17),
        title:
            const Text('Meu Carrinho', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: carrinho.itens.isEmpty
          ? const Center(
              child: Text(
                'Seu carrinho está vazio!',
                style: TextStyle(color: Colors.white54, fontSize: 18),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: carrinho.itens.length,
                    itemBuilder: (context, index) {
                      final itemCarrinho = carrinho.itens[index];
                      return Card(
                        color: const Color(0xFF0D1424),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child:
                                itemCarrinho.produto.imagem.startsWith('http')
                                    ? Image.network(itemCarrinho.produto.imagem,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover)
                                    : Image.asset(itemCarrinho.produto.imagem,
                                        width: 50,
                                        height: 50,
                                        fit: BoxFit.cover),
                          ),
                          title: Text(itemCarrinho.produto.nome,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text(
                              'Qtd: ${itemCarrinho.quantidade}  |  R\$ ${itemCarrinho.subtotal.toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.white54)),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete,
                                color: Colors.redAccent),
                            onPressed: () {
                              setState(() {
                                carrinho.remover(itemCarrinho.produto);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // --- RODAPÉ DE CHECKOUT ---
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D1424),
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(24)),
                    border:
                        Border.all(color: Colors.white.withValues(alpha: 0.05)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total da Compra:',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 16)),
                          Text(
                            'R\$ ${carrinho.valorTotal.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Colors.blueAccent.shade400,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent.shade400,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Compra finalizada com sucesso!'),
                                  backgroundColor: Colors.green),
                            );
                            setState(() {
                              carrinho.itens.clear();
                            });
                          },
                          child: const Text('Finalizar Compra',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
