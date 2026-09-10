import 'item.dart';
import 'item_especial.dart';

class Grupo {
  final String nome;
  final List<Item> _itens;

  Grupo({required this.nome, List<Item>? itens}) : _itens = [...?itens];

  List<Item> get itens => List.unmodifiable(_itens);

  void adicionar(Item item) => _itens.add(item);

  static Grupo catalogoInicial() {
    return Grupo(
      nome: 'Acervo Pixel',
      itens: const [
        Item(
            nome: 'Console Retro 16',
            preco: 799.90,
            categoria: 'Console retrô',
            descricao:
                'Console compacto com saída HDMI e biblioteca de jogos clássicos.',
            imagem:
                'https://images.unsplash.com/photo-1600080972464-8e5f35f63d08?w=900',
            fabricante: 'Pixel Forge',
            anoLancamento: 2024),
        ItemEspecial(
            nome: 'Guardião Estelar',
            preco: 249.90,
            categoria: 'Action figure',
            descricao:
                'Figura articulada para colecionadores, com acabamento metálico e acessórios.',
            imagem:
                'https://images.unsplash.com/photo-1594787318286-3d835c1d207f?w=900',
            fabricante: 'Nova Toys',
            anoLancamento: 2023,
            material: 'PVC de alta resistência',
            dimensoes: '18 cm de altura'),
        ItemEspecial(
            nome: 'Carta Dragão Elétrico',
            preco: 119.90,
            categoria: 'Card colecionável',
            descricao:
                'Card holográfico em sleeve protetora, ideal para coleções e exposições.',
            imagem:
                'https://images.unsplash.com/photo-1613771404784-3a5686aa2be3?w=900',
            fabricante: 'Card Lab',
            anoLancamento: 2025,
            material: 'Papel premium holográfico',
            dimensoes: '63 x 88 mm'),
      ],
    );
  }
}
