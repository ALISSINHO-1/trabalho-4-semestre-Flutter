import 'package:flutter/material.dart';

import '../models/item.dart';

class CadastroPage extends StatefulWidget {
  final ValueChanged<Item> onSave;

  const CadastroPage({super.key, required this.onSave});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final precoController = TextEditingController();
  final descricaoController = TextEditingController();

  @override
  void dispose() {
    nomeController.dispose();
    precoController.dispose();
    descricaoController.dispose();
    super.dispose();
  }

  void _salvar() {
    final nome = nomeController.text.trim();
    final descricao = descricaoController.text.trim();
    final valor =
        double.tryParse(precoController.text.trim().replaceAll(',', '.'));

    if (nome.isEmpty || valor == null || valor < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Informe um nome e um preço válido.'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    widget.onSave(
      Item(
        nome: nome,
        preco: valor,
        categoria: 'Novo item',
        descricao:
            descricao.isEmpty ? 'Item cadastrado no catálogo.' : descricao,
        imagem: '',
        fabricante: 'Cadastro local',
        anoLancamento: DateTime.now().year,
        cadastro: DateTime.now(),
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF030B17),
      appBar: AppBar(
        title: const Text('Cadastrar item'),
        backgroundColor: const Color(0xFF030B17),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              controller: nomeController,
              style: const TextStyle(color: Colors.white),
              decoration: _decoration('Nome'),
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'Informe o nome do item'
                  : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: precoController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              style: const TextStyle(color: Colors.white),
              decoration: _decoration('Preço', prefixText: 'R\$ '),
              validator: (value) {
                final parsed =
                    double.tryParse(value?.trim().replaceAll(',', '.') ?? '');
                return parsed == null || parsed < 0
                    ? 'Informe um preço válido'
                    : null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descricaoController,
              maxLines: 4,
              style: const TextStyle(color: Colors.white),
              decoration: _decoration('Descrição'),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 50,
              child: FilledButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) _salvar();
                },
                icon: const Icon(Icons.add),
                label: const Text('Adicionar ao catálogo'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _decoration(String label, {String? prefixText}) {
    return InputDecoration(
      labelText: label,
      prefixText: prefixText,
      labelStyle: const TextStyle(color: Colors.white54),
      filled: true,
      fillColor: const Color(0xFF0D1424),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.blueAccent.shade400),
      ),
    );
  }
}
