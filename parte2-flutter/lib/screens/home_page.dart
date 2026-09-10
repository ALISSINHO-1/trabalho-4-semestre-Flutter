import 'package:flutter/material.dart';

import '../models/grupo.dart';
import '../models/item.dart';
import 'cadastro_page.dart';
import 'detalhe_page.dart';
import 'widgets/item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Grupo catalogo = Grupo.catalogoInicial();

  void _abrirDetalhe(Item item) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => DetalhePage(item: item)));
  }

  Future<void> _abrirCadastro() async {
    final novoItem = await Navigator.of(context).push<Item>(MaterialPageRoute(
        builder: (_) =>
            CadastroPage(onSave: (item) => Navigator.of(context).pop(item))));
    if (novoItem != null && mounted)
      setState(() => catalogo.adicionar(novoItem));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(catalogo.nome), actions: [
          IconButton(
              onPressed: _abrirCadastro,
              icon: const Icon(Icons.add_box_outlined),
              tooltip: 'Cadastrar item')
        ]),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: LayoutBuilder(builder: (context, constraints) {
            final colunas = constraints.maxWidth >= 700 ? 3 : 2;
            return GridView.builder(
              itemCount: catalogo.itens.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: colunas,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: .72),
              itemBuilder: (_, index) {
                final item = catalogo.itens[index];
                return ItemCard(item: item, onTap: () => _abrirDetalhe(item));
              },
            );
          }),
        ),
      );
}
