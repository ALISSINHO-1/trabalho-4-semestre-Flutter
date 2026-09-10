import 'package:flutter/material.dart';

import '../models/item.dart';
import '../models/item_especial.dart';

class DetalhePage extends StatelessWidget {
  final Item item;

  const DetalhePage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final especial = item is ItemEspecial ? item as ItemEspecial : null;
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do item')),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AspectRatio(
                aspectRatio: 1.25,
                child: Image.network(item.imagem, fit: BoxFit.cover))),
        const SizedBox(height: 20),
        Text(item.categoria.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: 8),
        Text(item.nome, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 8),
        Text(item.precoFormatado,
            style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 20),
        Text(item.descricao, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 24),
        _InfoRow(label: 'Fabricante', value: item.fabricante),
        _InfoRow(
            label: 'Ano de lançamento', value: item.anoLancamento.toString()),
        if (especial != null) ...[
          _InfoRow(label: 'Material', value: especial.material),
          _InfoRow(label: 'Dimensões', value: especial.dimensoes)
        ],
        const SizedBox(height: 24),
        FilledButton.icon(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Compra simulada com sucesso.'))),
            icon: const Icon(Icons.shopping_bag_outlined),
            label: const Text('Comprar')),
      ]),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
            width: 150,
            child: Text(label,
                style: const TextStyle(fontWeight: FontWeight.bold))),
        Expanded(child: Text(value))
      ]));
}
