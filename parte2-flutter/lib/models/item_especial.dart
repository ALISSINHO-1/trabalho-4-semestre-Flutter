import 'item.dart';

class ItemEspecial extends Item {
  final String material;
  final String dimensoes;

  const ItemEspecial({
    required super.nome,
    required super.preco,
    required super.categoria,
    required super.descricao,
    required super.imagem,
    required super.fabricante,
    required super.anoLancamento,
    required this.material,
    required this.dimensoes,
  });
}
