import 'package:parte1_dart/models/grupo.dart';
import 'package:parte1_dart/models/item.dart';
import 'package:parte1_dart/models/item_especial.dart';

void main() {
  final playStation2 = Item(
    nome: 'PlayStation 2',
    preco: 599.90,
    categoria: 'Consoles',
    descricao: 'Console da sexta geração lançado no ano 2000.',
    imagem: 'https://m.media-amazon.com/images/I/319vp+K2hxL.jpg',
    fabricante: 'Sony Computer Entertainment',
    anoLancamento: 2000,
  );

  print('===== [1] ENTIDADE PRINCIPAL =====');
  print('Produto: ${playStation2.nome}');
  print('Categoria: ${playStation2.categoria}');
  print('Preço: R\$ ${playStation2.preco.toStringAsFixed(2)}');
  print('Fabricante: ${playStation2.fabricante}');
  print('Ano de lançamento: ${playStation2.anoLancamento}');

  final spiderMan = ItemEspecial(
    nome: 'Spider-Man (10th Anniversary)',
    preco: 1699.99,
    categoria: 'Colecionáveis',
    descricao: 'Estátua comemorativa do Homem-Aranha para colecionadores.',
    imagem: 'assets/images/iron_studios/spider_man_10th.jpg',
    fabricante: 'Iron Studios',
    anoLancamento: 2023,
    material: 'Polystone',
    dimensoes: 'Art Scale 1/10',
  );

  print('\n===== [2] HERANÇA =====');
  print('Item comum: ${playStation2.nome}');
  print('  Categoria: ${playStation2.categoria}');
  print('  Preço: R\$ ${playStation2.preco.toStringAsFixed(2)}');
  print('Item especializado: ${spiderMan.nome}');
  print('  Categoria herdada: ${spiderMan.categoria}');
  print('  Material: ${spiderMan.material}');
  print('  Dimensões: ${spiderMan.dimensoes}');

  final superNintendo = Item(
    nome: 'Super Nintendo',
    preco: 449.90,
    categoria: 'Consoles',
    descricao: 'Console retrô clássico da Nintendo.',
    imagem: '',
    fabricante: 'Nintendo',
    anoLancamento: 1990,
  );

  final grupo = Grupo(
    nome: 'Acervo Pixel',
    itens: [playStation2, superNintendo, spiderMan],
  );

  print('\n===== [3] COMPOSIÇÃO =====');
  print('Grupo "${grupo.nome}" contém ${grupo.itens.length} itens:');
  for (final item in grupo.itens) {
    print('  - ${item.nome}');
  }

  final xbox360 = Item(
    nome: 'Xbox 360 Slim',
    preco: 799.90,
    categoria: 'Consoles',
    descricao: 'Console com design elegante e Wi-Fi integrado.',
    imagem: 'assets/images/consoles/xbox.jpg',
    fabricante: 'Microsoft',
    anoLancamento: 2010,
  );

  print('\n===== [4] ENCAPSULAMENTO =====');
  print('Total atual: R\$ ${grupo.valorTotal.toStringAsFixed(2)}');
  print('Adicionando ${xbox360.nome} através de grupo.adicionar(...).');
  grupo.adicionar(xbox360);
  print('Novo total: R\$ ${grupo.valorTotal.toStringAsFixed(2)}');
  print(
      'Os itens internos são protegidos por _itens e acessados por um getter somente leitura.');
}
