import 'item.dart';

class ItemEspecial extends Item {
  final String categoria;
  final double desconto;

  ItemEspecial({
    required super.nome,
    required super.quantidade,
    required super.preco,
    required super.cadastro,
    super.ativo,
    required this.categoria,
    required this.desconto,
  });

  @override
  String ficha() {
    return '${super.ficha()}, Categoria: $categoria, Desconto: ${(desconto * 100).toStringAsFixed(0)}%';
  }
}