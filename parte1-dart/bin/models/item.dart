class Item {
  final String nome;
  final int quantidade;
  final double preco;
  final DateTime cadastro;
  final bool ativo;

  Item({
    required this.nome,
    required this.quantidade,
    required this.preco,
    required this.cadastro,
    this.ativo = true,
  });

  String ficha() {
    return '$nome, $quantidade un, R\$ ${preco.toStringAsFixed(2)}';
  }
}