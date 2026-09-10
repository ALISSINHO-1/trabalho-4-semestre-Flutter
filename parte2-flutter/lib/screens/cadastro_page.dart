import 'package:flutter/material.dart';

import '../models/item.dart';

class CadastroPage extends StatefulWidget {
  final ValueChanged<Item> onSave;

  const CadastroPage({super.key, required this.onSave});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nome = TextEditingController();
  final preco = TextEditingController();
  final descricao = TextEditingController();

  @override
  void dispose() {
    nome.dispose();
    preco.dispose();
    descricao.dispose();
    super.dispose();
  }

  void _salvar() {
    final valor = double.tryParse(preco.text.replaceAll(',', '.'));
    if (nome.text.trim().isEmpty || valor == null) return;
    widget.onSave(Item(
        nome: nome.text.trim(),
        preco: valor,
        categoria: 'Novo item',
        descricao: descricao.text.trim().isEmpty
            ? 'Item cadastrado no catálogo.'
            : descricao.text.trim(),
        imagem:
            'https://images.unsplash.com/photo-1600080972464-8e5f35f63d08?w=900',
        fabricante: 'Cadastro local',
        anoLancamento: DateTime.now().year));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Cadastrar item')),
        body: ListView(padding: const EdgeInsets.all(20), children: [
          TextField(
              controller: nome,
              decoration: const InputDecoration(
                  labelText: 'Nome', border: OutlineInputBorder())),
          const SizedBox(height: 16),
          TextField(
              controller: preco,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Preço',
                  prefixText: 'R\$ ',
                  border: OutlineInputBorder())),
          const SizedBox(height: 16),
          TextField(
              controller: descricao,
              maxLines: 4,
              decoration: const InputDecoration(
                  labelText: 'Descrição', border: OutlineInputBorder())),
          const SizedBox(height: 24),
          FilledButton(
              onPressed: _salvar, child: const Text('Adicionar ao catálogo')),
        ]),
      );
}
