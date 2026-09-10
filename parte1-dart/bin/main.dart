import 'models/item.dart';
import 'models/item_especial.dart';
import 'models/grupo.dart';

void main() {
  final item1 = Item(
    nome: 'Item Padrão A',
    quantidade: 2,
    preco: 150.0,
    cadastro: DateTime(2026, 9, 1),
  );

  print('===== [1] ENTIDADE PRINCIPAL =====');
  print('Item: ${item1.nome} | Qtd: ${item1.quantidade} | Preço: R\$ ${item1.preco.toStringAsFixed(2)} | Data: ${item1.cadastro.day}/${item1.cadastro.month}/${item1.cadastro.year}');

  print('\n===== [2] HERANÇA =====');
  final itemEspecial = ItemEspecial(
    nome: 'Item Premium B',
    quantidade: 1,
    preco: 300.0,
    cadastro: DateTime(2026, 9, 5),
    categoria: 'Edição de Luxo',
    desconto: 0.15,
  );
  print('Item comum -> ficha: "${item1.ficha()}"');
  print('ItemEspecial -> ficha: "${itemEspecial.ficha()}"');

  print('\n===== [3] COMPOSIÇÃO =====');
  final item2 = Item(
    nome: 'Item Básico C',
    quantidade: 3,
    preco: 50.0,
    cadastro: DateTime(2026, 9, 8),
  );

  final grupo = Grupo(
    nome: 'Coleção Principal',
    itensIniciais: [item1, itemEspecial, item2],
  );

  print('Grupo "${grupo.nome}" contém ${grupo.itens.length} itens:');
  for (final item in grupo.itens) {
    print('  - ${item.nome}');
  }

  print('\n===== [4] ENCAPSULAMENTO =====');
  print('Grupo "${grupo.nome}" -> total (calculado): R\$ ${grupo.valorTotal.toStringAsFixed(2)}');

  final itemExtra = Item(
    nome: 'Item Extra D',
    quantidade: 1,
    preco: 200.0,
    cadastro: DateTime(2026, 9, 9),
  );
  grupo.adicionar(itemExtra);

  print('Após adicionar "${itemExtra.nome}" (R\$ ${itemExtra.preco.toStringAsFixed(2)}): R\$ ${grupo.valorTotal.toStringAsFixed(2)}');
}