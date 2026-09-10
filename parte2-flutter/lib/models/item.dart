class Item {
  final String nome;
  final double preco;
  final String categoria;
  final String descricao;
  final String imagem;
  final String fabricante;
  final int anoLancamento;

  const Item({
    required this.nome,
    required this.preco,
    required this.categoria,
    required this.descricao,
    required this.imagem,
    required this.fabricante,
    required this.anoLancamento,
  });

  String get precoFormatado =>
      'R\$ ${preco.toStringAsFixed(2).replaceAll('.', ',')}';
}
