class Item {
  final String nome;
  final double preco;
  final String categoria;
  final String descricao;
  final String imagem;
  final String fabricante;
  final int anoLancamento;
  final List<String> galeria;

  Item({
    required this.nome,
    required this.preco,
    required this.categoria,
    required this.descricao,
    required this.imagem,
    required this.fabricante,
    required this.anoLancamento,
    this.galeria = const [],
  });

  String ficha() => '$nome, R\$ ${preco.toStringAsFixed(2)}';
}
