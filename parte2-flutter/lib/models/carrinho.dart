import 'item.dart';

// Representa um item específico dentro do carrinho (Produto + Quantidade)
class ItemCarrinho {
  final Item produto;
  int quantidade;

  ItemCarrinho({required this.produto, required this.quantidade});

  double get subtotal => produto.preco * quantidade;
}


class Carrinho {
  static final Carrinho _instancia = Carrinho._interno();
  factory Carrinho() => _instancia;
  Carrinho._interno();

  List<ItemCarrinho> itens = [];

  void adicionar(Item item, int quantidade) {
    // Se o item já existir no carrinho, apenas soma a quantidade
    int index = itens.indexWhere((i) => i.produto.nome == item.nome);
    if (index >= 0) {
      itens[index].quantidade += quantidade;
    } else {
      itens.add(ItemCarrinho(produto: item, quantidade: quantidade));
    }
  }

  void remover(Item item) {
    itens.removeWhere((i) => i.produto.nome == item.nome);
  }

  double get valorTotal {
    double total = 0.0;
    for (var item in itens) {
      total += item.subtotal;
    }
    return total;
  }
}