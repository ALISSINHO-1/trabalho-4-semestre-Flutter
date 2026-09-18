import 'item.dart';

class Favoritos {
  Favoritos._();

  static final Favoritos _instance = Favoritos._();

  factory Favoritos() => _instance;

  final List<Item> _itens = [];

  List<Item> get itens => List.unmodifiable(_itens);

  bool contem(Item item) =>
      _itens.any((favorito) => favorito.nome == item.nome);

  void adicionar(Item item) {
    if (!contem(item)) _itens.add(item);
  }

  void remover(Item item) {
    _itens.removeWhere((favorito) => favorito.nome == item.nome);
  }

  void alternar(Item item) {
    if (contem(item)) {
      remover(item);
    } else {
      adicionar(item);
    }
  }
}
