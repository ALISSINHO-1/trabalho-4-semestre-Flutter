import 'package:flutter/material.dart';

import '../models/grupo.dart';

class CategoriasPage extends StatelessWidget {
  final Grupo grupo;

  const CategoriasPage({super.key, required this.grupo});

  static const _categorias = [
    (
      nome: 'Consoles',
      descricao: 'Reviva grandes gerações',
      icone: Icons.gamepad,
    ),
    (
      nome: 'Jogos',
      descricao: 'Clássicos que marcaram época',
      icone: Icons.videogame_asset,
    ),
    (
      nome: 'Action Figures',
      descricao: 'Personagens que ganharam forma',
      icone: Icons.sports_martial_arts,
    ),
    (
      nome: 'Cartas',
      descricao: 'Coleções que contam histórias',
      icone: Icons.catching_pokemon,
    ),
    (
      nome: 'Colecionáveis',
      descricao: 'Peças premium para verdadeiros colecionadores',
      icone: Icons.workspace_premium,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01040A),
      appBar: AppBar(
        title: const Text('Categorias'),
        backgroundColor: const Color(0xFF01040A),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth >= 1100
              ? 4
              : constraints.maxWidth >= 700
                  ? 3
                  : constraints.maxWidth >= 450
                      ? 2
                      : 1;

          return GridView.builder(
            padding: const EdgeInsets.all(20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: columns == 1 ? 2.2 : 1.25,
            ),
            itemCount: _categorias.length,
            itemBuilder: (context, index) {
              final categoria = _categorias[index];
              final quantidade = grupo.itens
                  .where((item) => item.categoria == categoria.nome)
                  .length;

              return _CategoriaCard(
                nome: categoria.nome,
                descricao: categoria.descricao,
                icone: categoria.icone,
                quantidade: quantidade,
                onTap: () => Navigator.of(context).pop(categoria.nome),
              );
            },
          );
        },
      ),
    );
  }
}

class _CategoriaCard extends StatelessWidget {
  final String nome;
  final String descricao;
  final IconData icone;
  final int quantidade;
  final VoidCallback onTap;

  const _CategoriaCard({
    required this.nome,
    required this.descricao,
    required this.icone,
    required this.quantidade,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1424),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.blueAccent.withValues(alpha: 0.22),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withValues(alpha: 0.10),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icone, color: Colors.blueAccent.shade200, size: 40),
            Text(
              nome,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              descricao,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white70, height: 1.3),
            ),
            Text(
              quantidade.toString() + (quantidade == 1 ? ' item' : ' itens'),
              style: TextStyle(
                color: Colors.blueAccent.shade200,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
