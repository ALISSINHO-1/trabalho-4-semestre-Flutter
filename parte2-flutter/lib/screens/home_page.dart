import 'package:flutter/material.dart';

import '../models/favoritos.dart';
import '../models/grupo.dart';
import '../models/item.dart';
import 'cadastro_page.dart';
import 'carrinho_page.dart';
import 'categorias_page.dart';
import 'conta_page.dart';
import 'detalhe_page.dart';
import 'favoritos_page.dart';
import 'widgets/cartao.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Grupo grupo;
  String categoriaSelecionada = 'Todos';
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    grupo = Grupo.catalogoInicial();
  }

  @override
  Widget build(BuildContext context) {
    final List<Item> itensExibidos = categoriaSelecionada == 'Todos'
        ? grupo.itens.toList()
        : grupo.itens
            .where(
              (item) =>
                  item.categoria.trim().toLowerCase() ==
                  categoriaSelecionada.trim().toLowerCase(),
            )
            .toList();

    return Scaffold(
      backgroundColor: const Color(0xFF01040A),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color(0xFF01040A).withValues(alpha: 0.85),
        elevation: 0,
        title: Row(
          children: [
            const Text(
              'Play ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            Text(
              'Retrô',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent.shade400,
                fontSize: 22,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Colors.white),
            tooltip: 'Adicionar produto',
            onPressed: _abrirCadastro,
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            tooltip: 'Favoritos',
            onPressed: _abrirFavoritos,
          ),
          IconButton(
            icon: const Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ContaPage()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CarrinhoPage()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: 50,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueAccent.withValues(alpha: 0.10),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purpleAccent.withValues(alpha: 0.08),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.blueAccent.withValues(alpha: 0.4),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withValues(alpha: 0.15),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=900',
                      ),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black54,
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Press Start para começar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          height: 1.1,
                          letterSpacing: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Conectando mundos, unindo jogadores.',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          _buildCategoriaBotao(
                            Icons.grid_view,
                            'Todos',
                            categoriaSelecionada == 'Todos',
                          ),
                          const SizedBox(width: 12),
                          _buildCategoriaBotao(
                            Icons.gamepad,
                            'Consoles',
                            categoriaSelecionada == 'Consoles',
                          ),
                          const SizedBox(width: 12),
                          _buildCategoriaBotao(
                            Icons.videogame_asset,
                            'Jogos',
                            categoriaSelecionada == 'Jogos',
                          ),
                          const SizedBox(width: 12),
                          _buildCategoriaBotao(
                            Icons.sports_martial_arts,
                            'Action Figures',
                            categoriaSelecionada == 'Action Figures',
                          ),
                          const SizedBox(width: 12),
                          _buildCategoriaBotao(
                            Icons.catching_pokemon,
                            'Cartas',
                            categoriaSelecionada == 'Cartas',
                          ),
                          const SizedBox(width: 12),
                          _buildCategoriaBotao(
                            Icons.workspace_premium,
                            'Colecionáveis',
                            categoriaSelecionada == 'Colecionáveis',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            categoriaSelecionada == 'Todos'
                                ? 'Destaques'
                                : categoriaSelecionada,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Valor da coleção: R\$ ${grupo.valorTotal.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${itensExibidos.length} itens',
                            style: TextStyle(
                              color: Colors.blueAccent.shade200,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (categoriaSelecionada != 'Todos') ...[
                            const SizedBox(width: 12),
                            GestureDetector(
                              onTap: () => setState(
                                () => categoriaSelecionada = 'Todos',
                              ),
                              child: Text(
                                'Ver todos ➔',
                                style: TextStyle(
                                  color: Colors.blueAccent.shade400,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: itensExibidos.isEmpty
                      ? const Center(
                          child: Text(
                            'Nenhum item encontrado nesta categoria.',
                            style: TextStyle(color: Colors.white54),
                          ),
                        )
                      : Center(
                          child: SizedBox(
                            height: 300,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: itensExibidos.length,
                              itemBuilder: (context, index) {
                                final item = itensExibidos[index];
                                return CartaoRetro(
                                  item: item,
                                  favoritado: Favoritos().contem(item),
                                  onFavoriteToggle: () => setState(
                                    () => Favoritos().alternar(item),
                                  ),
                                  onTap: () async {
                                    await Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => DetalhePage(item: item),
                                      ),
                                    );
                                    if (mounted) setState(() {});
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF01040A),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent.shade400,
        unselectedItemColor: Colors.white54,
        elevation: 16,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
          switch (index) {
            case 0:
              setState(() => categoriaSelecionada = 'Todos');
              break;
            case 1:
              _abrirCategorias();
              break;
            case 2:
              _abrirFavoritos();
              break;
            case 3:
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CarrinhoPage()),
              );
              break;
            case 4:
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ContaPage()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Carrinho',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  Future<void> _abrirCadastro() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CadastroPage(onSave: _adicionarItem)),
    );
  }

  Future<void> _abrirFavoritos() async {
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const FavoritosPage()),
    );
    if (mounted) setState(() => _currentIndex = 0);
  }

  Future<void> _abrirCategorias() async {
    final categoria = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => CategoriasPage(grupo: grupo)),
    );
    if (!mounted) return;
    setState(() {
      _currentIndex = 0;
      if (categoria != null) categoriaSelecionada = categoria;
    });
  }

  void _adicionarItem(Item item) {
    setState(() {
      grupo.adicionar(item);
      categoriaSelecionada = 'Todos';
    });
  }

  Widget _buildCategoriaBotao(IconData icone, String titulo, bool ativo) {
    return GestureDetector(
      onTap: () => setState(() => categoriaSelecionada = titulo),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 90,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: ativo
              ? Colors.blueAccent.withValues(alpha: 0.15)
              : const Color(0xFF080D1A).withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ativo
                ? Colors.blueAccent.shade400
                : Colors.white.withValues(alpha: 0.05),
            width: ativo ? 1.5 : 1,
          ),
          boxShadow: ativo
              ? [
                  BoxShadow(
                    color: Colors.blueAccent.withValues(alpha: 0.25),
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            Icon(
              icone,
              color: ativo
                  ? Colors.blueAccent.shade200
                  : Colors.blueAccent.shade400,
              size: 26,
            ),
            const SizedBox(height: 8),
            Text(
              titulo,
              style: TextStyle(
                color: ativo ? Colors.white : Colors.white70,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
