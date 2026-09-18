class Item {
  final String nome;
  final double preco;
  final String categoria;
  final String descricao;
  final String imagem;
  final String fabricante;
  final int anoLancamento;
  final List<String> galeria;

  // Conceitos reaproveitados da Parte 1, mantidos com valores seguros para a UI.
  final int quantidade;
  final DateTime cadastro;
  final bool ativo;

  Item({
    required this.nome,
    required this.preco,
    required this.categoria,
    required this.descricao,
    required this.imagem,
    required this.fabricante,
    required this.anoLancamento,
    this.galeria = const [],
    this.quantidade = 1,
    required this.cadastro,
    this.ativo = true,
  });

  String ficha() => '$nome, $quantidade un, R\$ ${preco.toStringAsFixed(2)}';
}
