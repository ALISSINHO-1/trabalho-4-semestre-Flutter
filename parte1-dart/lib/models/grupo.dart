import 'item.dart';

class Grupo {
  final String nome;
  final List<Item> _itens;

  Grupo({required this.nome, List<Item>? itens}) : _itens = [...?itens];

  List<Item> get itens => List.unmodifiable(_itens);

  void adicionar(Item item) => _itens.add(item);

  double get valorTotal =>
      _itens.fold(0.0, (total, item) => total + item.preco);
}
