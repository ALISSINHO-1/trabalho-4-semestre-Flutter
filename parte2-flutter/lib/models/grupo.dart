import 'item.dart';
import 'item_especial.dart';

class Grupo {
  final String nome;
  final List<Item> _itens;

  Grupo({required this.nome, List<Item>? itens}) : _itens = [...?itens];

  List<Item> get itens => List.unmodifiable(_itens);

  double get valorTotal {
    double total = 0;
    for (final item in _itens) {
      total += item.preco * item.quantidade;
    }
    return total;
  }

  void adicionar(Item item) => _itens.add(item);

  static Grupo catalogoInicial() {
    return Grupo(
      nome: 'Acervo Pixel',
      itens: [
        Item(
          nome: 'Xbox 360 Slim',
          preco: 799.90,
          categoria: 'Consoles',
          descricao:
              'Console retrô com design elegante, silencioso e Wi-Fi integrado.',
          imagem: 'assets/images/consoles/xbox.jpg',
          fabricante: 'Microsoft',
          anoLancamento: 2010,
          cadastro: DateTime(2026, 1, 1),
        ),
        Item(
          nome: 'PlayStation 2',
          preco: 599.90,
          categoria: 'Consoles',
          descricao:
              'Um dos consoles mais populares da sexta geração, lançado no ano 2000.',
          imagem: '',
          fabricante: 'Sony Computer Entertainment',
          anoLancamento: 2000,
          cadastro: DateTime(2026, 1, 2),
        ),
        ItemEspecial(
          nome: 'Action Figure Spider-Man',
          preco: 1699.99,
          categoria: 'Action Figures',
          descricao:
              'Action figure articulado do herói em pose dinâmica, com acabamento detalhado.',
          imagem: '',
          fabricante: 'Iron Studios',
          anoLancamento: 2023,
          material: 'Polystone',
          dimensoes: 'Escala 1/10',
          desconto: 0.10,
          cadastro: DateTime(2026, 1, 3),
        ),
        Item(
          nome: 'Action Figure Batman',
          preco: 7499.99,
          categoria: 'Action Figures',
          descricao:
              'Peça de coleção com pose imponente, capa marcante e pintura manual.',
          imagem: '',
          fabricante: 'Iron Studios',
          anoLancamento: 2023,
          cadastro: DateTime(2026, 1, 4),
        ),
        Item(
          nome: 'Pokémon TCG Elite Trainer Box',
          preco: 459.99,
          categoria: 'Cartas',
          descricao:
              'Caixa premium para jogadores e colecionadores que desejam expandir seus decks.',
          imagem: '',
          fabricante: 'The Pokémon Company',
          anoLancamento: 2025,
          cadastro: DateTime(2026, 1, 5),
        ),
        Item(
          nome: 'Pokémon TCG Mega Evolução',
          preco: 135.99,
          categoria: 'Cartas',
          descricao:
              'Produto de cartas colecionáveis para montar estratégias e ampliar a coleção.',
          imagem: '',
          fabricante: 'The Pokémon Company',
          anoLancamento: 2025,
          cadastro: DateTime(2026, 1, 6),
        ),
        ItemEspecial(
          nome: 'Spider-Man (10th Anniversary)',
          preco: 1699.99,
          categoria: 'Colecionáveis',
          descricao:
              'Estátua comemorativa do Homem-Aranha em escala 1/10, com pose dinâmica e acabamento para colecionadores.',
          imagem: 'assets/images/iron_studios/spider_man_10th.jpg',
          fabricante: 'Iron Studios',
          anoLancamento: 2023,
          material: 'Polystone',
          dimensoes: 'Art Scale 1/10',
          cadastro: DateTime(2026, 1, 7),
        ),
        ItemEspecial(
          nome: 'Batman Unleashed Deluxe',
          preco: 1049.99,
          categoria: 'Colecionáveis',
          descricao:
              'Versão Deluxe do Cavaleiro das Trevas sobre uma base inspirada na Batcaverna, com capa em tecido e detalhes temáticos.',
          imagem: 'assets/images/iron_studios/batman_unleashed_deluxe.jpg',
          fabricante: 'Iron Studios',
          anoLancamento: 2024,
          material: 'Polystone e tecido',
          dimensoes: 'Art Scale 1/10',
          cadastro: DateTime(2026, 1, 8),
        ),
        ItemEspecial(
          nome: 'Darth Vader on Throne',
          preco: 1499.99,
          categoria: 'Colecionáveis',
          descricao:
              'Darth Vader sentado em seu trono em uma composição imponente da linha Art Scale, inspirada em Star Wars.',
          imagem: 'assets/images/iron_studios/darth_vader_throne.jpg',
          fabricante: 'Iron Studios',
          anoLancamento: 2022,
          material: 'Polystone',
          dimensoes: 'Art Scale 1/10',
          cadastro: DateTime(2026, 1, 9),
        ),
        ItemEspecial(
          nome: 'Sauron Deluxe',
          preco: 1599.99,
          categoria: 'Colecionáveis',
          descricao:
              'Representação do Senhor das Trevas com armadura e maça de guerra, em uma base diorama inspirada em Mordor.',
          imagem: 'assets/images/iron_studios/sauron_deluxe.jpg',
          fabricante: 'Iron Studios',
          anoLancamento: 2024,
          material: 'Polystone',
          dimensoes: 'Art Scale 1/10',
          cadastro: DateTime(2026, 1, 10),
        ),
        ItemEspecial(
          nome: 'Galadriel',
          preco: 999.99,
          categoria: 'Colecionáveis',
          descricao:
              'Representação de Galadriel com elementos de Lothlórien e o Espelho de Galadriel na base.',
          imagem: 'assets/images/iron_studios/galadriel.jpg',
          fabricante: 'Iron Studios',
          anoLancamento: 2023,
          material: 'Polystone',
          dimensoes: 'Art Scale 1/10',
          cadastro: DateTime(2026, 1, 11),
        ),
        ItemEspecial(
          nome: 'Blue',
          preco: 999.99,
          categoria: 'Colecionáveis',
          descricao:
              'Estátua da velociraptor Blue inspirada em Jurassic World: Dominion, com sua faixa azul e terreno nevado na base.',
          imagem: 'assets/images/iron_studios/blue_jurassic_world.jpg',
          fabricante: 'Iron Studios',
          anoLancamento: 2022,
          material: 'Polystone',
          dimensoes: 'Art Scale 1/10',
          cadastro: DateTime(2026, 1, 12),
        ),
      ],
    );
  }
}
