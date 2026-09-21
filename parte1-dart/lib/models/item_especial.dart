import 'item.dart';

class ItemEspecial extends Item {
  final String material;
  final String dimensoes;

  ItemEspecial({
    required super.nome,
    required super.preco,
    required super.categoria,
    required super.descricao,
    required super.imagem,
    required super.fabricante,
    required super.anoLancamento,
    super.galeria,
    required this.material,
    required this.dimensoes,
  });
}
