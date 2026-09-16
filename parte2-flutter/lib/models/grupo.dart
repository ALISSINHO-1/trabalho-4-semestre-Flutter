import 'item.dart';

class Grupo {
  final String nome;
  final List<Item> _itens;

  Grupo({required this.nome, List<Item>? itens}) : _itens = [...?itens];

  List<Item> get itens => List.unmodifiable(_itens);

  // Getter calculado do valor total
  double get valorTotal {
    double total = 0.0;
    for (var item in _itens) {
      total += item.preco;
    }
    return total;
  }

  void adicionar(Item item) => _itens.add(item);

  // Método estático do catálogo inicial ajustado ao construtor da sua classe
  static Grupo catalogoInicial() {
    return Grupo(
      nome: 'Acervo Pixel',
      itens: [
        Item(
        
        // --- CONSOLES ---        
          nome: 'Xbox 360 Slim',
          preco: 799.90,
          categoria: 'Consoles',
          descricao: 'O Xbox 360 Slim trouxe um design muito mais elegante, silencioso e confiável, além de já vir com Wi-Fi embutido.',
          imagem: 'assets/images/consoles/xbox.jpg',
          fabricante: 'Microsoft',
          anoLancamento: 2010,
          galeria: const [
            'https://http2.mlstatic.com/D_NQ_NP_938487-MLB91967026288_092025-O.webp',
          ],
          
        ),

        Item(
          nome: 'Playstation 2',
          preco: 599.90,
          categoria: 'Consoles',
          descricao: 'O PlayStation 2 é um console de videogame de 64-bits da sexta geração, lançado pela Sony no ano 2000.',
          imagem: 'https://http2.mlstatic.com/D_NQ_NP_783443-MLA78158255856_082024-O.webp',
          fabricante: 'Sony Computer Entertainment',
          anoLancamento: 2000,
          galeria: const [
            'https://carrefourbr.vtexassets.com/arquivos/ids/185578544/image-0.jpg?v=638755904022070000',
          ],
        ),

        Item(
          nome: 'Super Nintendo',
          preco: 999.00,
          categoria: 'Consoles',
          descricao: 'O Super Nintendo Entertainment System (SNES) é um console de videogame de 16 bits desenvolvido pela Nintendo.',
          imagem: 'https://upload.wikimedia.org/wikipedia/commons/3/31/SNES-Mod1-Console-Set.jpg',
          fabricante: 'Nintendo',
          anoLancamento: 1990,
          galeria: const [
            'https://down-br.img.susercontent.com/file/sg-11134201-7rbmk-lozheb9w2pdq42',
          ],
        ),

        Item(
          nome: 'Atari 2600',
          preco: 1499.00,
          categoria: 'Consoles',
          descricao: 'O Atari 2600 é o maior símbolo da era de ouro dos videogames, popularizando o sistema de cartuchos.',
          imagem: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1RX2LVJgdbOSj5lxfNRXfgTFUgPowGP3Q1Fa9a-4LcAUtC0EU2lwjzC0&s=10',
          fabricante: 'Atari',
          anoLancamento: 1977,
          galeria: const [
            'https://m.media-amazon.com/images/I/81s1kOrnnKL._AC_UF1000,1000_QL80_.jpg',
          ],
        ),


        // --- JOGOS ---
        Item(
          nome: 'Minecraft Edition (Xbox)',
          preco: 98.90,
          categoria: 'Jogos', 
          descricao: ' a icônica versão de console que adaptou o fenômeno global dos blocos para as TVs e controles de videogame. Lançada em 2012, essa edição marcou época por sua jogabilidade simplificada e por trazer o famoso modo de tela dividida, permitindo que amigos jogassem juntos no mesmo sofá.',
          imagem: 'https://m.media-amazon.com/images/I/91NUBo2SGPL.jpg', 
          fabricante: 'Mojang Studios',
          anoLancamento: 2012,
          galeria: const [
            'https://minecraft.wiki/images/thumb/Xbox_360_Edition_TU69.png/1200px-Xbox_360_Edition_TU69.png?8c6fd',
          ],
        ),

        Item(
          nome: 'GTA San Andreas (PS2)',
          preco: 169.99,
          categoria: 'Jogos', 
          descricao: 'O clássico de mundo aberto da Rockstar que marcou a era do PlayStation 2.',
          imagem: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdtrs592LS98vNZz_RDeOt7oOC0fWEaYjsrgzg1YMMrA&s=10',
          fabricante: 'Rockstar Games',
          anoLancamento: 2004,
          galeria: const [
            'https://shared.akamai.steamstatic.com/store_item_assets/steam/apps/1547000/ss_a274e6069b8a242ea37cfdd37b7a2fb01fae9315.1920x1080.jpg?t=1781138712',
          ],
        ),

        Item(
          nome: 'Super Mario World (SNES)',
          preco: 499.99 ,
          categoria: 'Jogos', 
          descricao: 'A aventura atemporal de Mario e Yoshi no Super Nintendo.',
          imagem: 'https://acdn-us.mitiendanube.com/stores/001/734/413/products/super-mario-world-com-caixa1-04b8bb3094f987bee616292576561046-640-0.webp',
          fabricante: 'Nintendo',
          anoLancamento: 1990,
          galeria: const [
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTW0SlpMfQmeabOO3kKJgCMLFW8jwXH4sLKAMADBOQPz3-ZlHbatz0g8eV9&s=10',
          ],
        ),

        Item(
          nome: 'Space Invaders (Atari 2600)',
          preco: 139.99,
          categoria: 'Jogos',
          descricao: 'Space Invaders para o Atari 2600 é a versão doméstica do lendário jogo de fliperama. No controle de uma nave que se move apenas para os lados, o jogador deve destruir ondas de alienígenas que descem progressivamente em direção à Terra, usando barreiras temporárias como proteção contra os tiros inimigos.',
          imagem: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF9Ea-jbiqcug_YfmhUmM3XkdS8tWb3A7qd71mARkaAXle6_NH-LScFmU&s=10',
          fabricante: 'Atari',
          anoLancamento: 1980,
          galeria: const [
            'https://i.ytimg.com/vi/MU4psw3ccUI/maxresdefault.jpg',
          ],
        ),


      // --- ACTION FIGURES ---
        Item(
          nome: 'Estátua Spider-Man (10Th Anniversary) - Marvel Comics - Art Scale 1/10',
          preco: 1699.99,
          categoria: 'Action Figures',
          descricao: 'Produzida pela Iron Studios, a estátua Spider-Man (10th Anniversary) celebra uma década de excelência da marca. Com acabamento impecável e rica em detalhes, a peça apresenta o herói em uma pose dinâmica, destacando seu traje clássico com texturas e cores vibrantes. Produzida em polystone, a estátua captura com fidelidade a essência do personagem nos quadrinhos, sendo uma peça essencial para colecionadores e fãs do amigão da vizinhança.',
          imagem: 'https://ironstudios.com.br/cdn/shop/files/9910283_bc459776-0a40-4493-bd39-67f43faf8b9d.jpg?v=1785167912&width=1024',
          fabricante: 'Iron Studios',
          anoLancamento: 2023,
          galeria: const [
            'https://ironstudios.com.br/cdn/shop/files/7160134_fc4aee05-a652-4029-9d86-6197ef416b12.jpg?v=1785167911&width=1024',
          ],
        ),

         Item(
          nome: 'Estátua Batman Trinity - DC Comics',
          preco: 7499.99,
          categoria: 'Action Figures',
          descricao: 'Produzida pela Iron Studios, a estátua Batman Trinity – DC Comics – Legacy Replica 1/4 apresenta o Cavaleiro das Trevas em uma pose imponente e cheia de presença, destacando seu traje clássico, capa marcante e postura heroica. A peça conta com materiais de alta qualidade, como Polystone, podendo conter partes em resina, ABS, PVC, metal. E no acabamento, a pintura manual garante toque artístico único e exclusivo para a satisfação de qualquer colecionador.',
          imagem: 'https://ironstudios.com.br/cdn/shop/files/7130123.jpg?v=1779118691&width=1024', 
          fabricante: 'Iron Studios',
          anoLancamento: 2023,
          galeria: const [
            'https://ironstudios.com.br/cdn/shop/files/7130135.jpg?v=1779118692&width=1024',
          ],
        ),

         Item(
          nome: 'Figura Vegeta Super Saiyajin Awakened Super Saiyan Blood - Dragon Ball Z - SH Figuarts',
          preco: 359.99,
          categoria: 'Action Figures',
          descricao: 'Action figure articulado do Vegeta Super Saiyajin (Dragon Ball), vestindo sua armadura clássica azul e branca, com o icônico cabelo loiro espetado e pose de combate dinâmica.',
          imagem: 'https://ironstudios.com.br/cdn/shop/files/060387_1.jpg?v=1754158155&width=1024',
          fabricante: 'Bandai',
          anoLancamento: 2023,
          galeria: const [
            'https://ironstudios.com.br/cdn/shop/files/060387_2.jpg?v=1754158155&width=1024',
          ],
        ),

        Item(
          nome: 'Estátua Alien Big Chap - Alien',
          preco: 1299.99,
          categoria: 'Action Figures',
          descricao: 'Produzida pela Iron Studios, a estátua Alien Big Chap – Alien – Art Scale 1/10 retrata o lendário Xenomorfo em uma pose ameaçadora, destacando sua anatomia biomecânica, cauda articulada visualmente e os detalhes característicos que marcaram o filme original. Fabricada em Polystone de alta qualidade, a peça pode conter partes em resina, ABS e PVC, contando com acabamento pintado à mão para reproduzir fielmente a aparência sombria da criatura.',
          imagem: 'https://ironstudios.com.br/cdn/shop/files/10898743.jpg?v=1783349546&width=1024',
          fabricante: 'Iron Studios',
          anoLancamento: 2023,
          galeria: const [
            'https://ironstudios.com.br/cdn/shop/files/7141239.jpg?v=1783349546&width=1024',
          ],
        ),



        // --- CARTAS POKÉMON ---
        Item(
          nome: 'Pokemon TCG: Mega Evolution - Chaos Rising - Elite Trainer Box - Ingles',
          preco: 459.99,
          categoria: 'Cartas',
          descricao: 'Pokemon TCG: Mega Evolution - Chaos Rising - Elite Trainer Box - Ingles - GalapagosA Elite Trainer Box – Mega Evolution: Chaos Rising é uma edição premium do Pokémon Trading Card Game, desenvolvida para jogadores e colecionadores que desejam expandir suas coleções e aprimorar seus decks. A expansão Chaos Rising traz novas Mega Evoluções, cartas especiais e estratégias inéditas para o jogo',
          imagem: 'https://ironstudios.com.br/cdn/shop/files/10698943_bca74bad-39a1-40ce-8584-605ff7738c90.jpg?v=1781042220&width=1024',
          fabricante: 'The Pokémon Company',
          anoLancamento: 2026,
          galeria: const [
            'https://http2.mlstatic.com/D_NQ_NP_2X_972050-MLA112316682871_052026-F.webp',
          ],
        ),

        Item(
          nome: 'Desafio Estratégico Megaevolução Pokemon TCG - BR',
          preco: 135.99,
          categoria: 'Cartas',
          descricao: 'Pokémon de todos os tipos colocam tudo em jogo para demonstrar sua força e se tornar Pokémon ex de Megaevolução! Comande a aura impetuosa de Mega Lucario ex, acolha o poder transbordante de Mega Gardevoir ex e una-se a outros desses poderosos Pokémon, que esbanjam ataques devastadores e PS fora da curva. Mas muito cuidado com sua estratégia, já que mais poderes sempre trazem mais riscos! Escolha seus parceiros Pokémon e prepare-se para as maiores batalhas que você já travou na expansão Megaevolução do Pokémon Estampas Ilustradas!',
          imagem: 'https://http2.mlstatic.com/D_NQ_NP_2X_988019-MLA101781168790_122025-F.webp',
          fabricante: 'The Pokémon Company',
          anoLancamento: 2026,
          galeria: const [
            'https://http2.mlstatic.com/D_NQ_NP_2X_603077-MLA113474418733_062026-F.webp',
          ],
        ),

        Item(
          nome: 'Combo De Booster Megaevolução Equilibrio Perfeito- Pokemon Tcg Port - BR',
          preco: 232.99,
          categoria: 'Cartas',
          descricao: 'Ideal para colecionadores, jogadores e para quem busca melhor custo por booster na expansão Equilíbrio Perfeito. Este combo é perfeito para quem deseja expandir sua coleção com um total de 108 cartas, proporcionando uma experiência rica e diversificada. O jogo é projetado para 2 a 4 jogadores, com uma idade mínima recomendada de 4 anos, tornando-o acessível para toda a família. As cartas são cromadas, oferecendo um toque especial para os colecionadores. Com uma embalagem compacta de 8 cm de altura, 6 cm de comprimento e 11 cm de largura, e um peso de apenas 200 g, é fácil de armazenar e transportar. Prepare-se para mergulhar no emocionante mundo do TCG com este combo incrível!',
          imagem: 'https://http2.mlstatic.com/D_NQ_NP_2X_866924-MLA109473058307_032026-F.webp',
          fabricante: 'The Pokémon Company',
          anoLancamento: 2026,
          galeria: const [
            'https://http2.mlstatic.com/D_NQ_NP_2X_915706-MLA109199692728_042026-F.webp',
          ],
        ),

        Item(
          nome: 'Calendário Pokémon De Festas De Fim De Ano 2025 - BR',
          preco: 387.99,
          categoria: 'Cartas',
          descricao: 'Pokémon de todos os tipos colocam tudo em jogo para demonstrar sua força e se tornar Pokémon ex de Megaevolução! Comande a aura impetuosa de Mega Lucario ex, acolha o poder transbordante de Mega Gardevoir ex e una-se a outros desses poderosos Pokémon, que esbanjam ataques devastadores e PS fora da curva. Mas muito cuidado com sua estratégia, já que mais poderes sempre trazem mais riscos! Escolha seus parceiros Pokémon e prepare-se para as maiores batalhas que você já travou na expansão Megaevolução do Pokémon Estampas Ilustradas!',
          imagem: 'https://livrariascuritiba.vteximg.com.br/arquivos/ids/2227100-1000-1000/IN033082.jpg?v=638950981222270000',
          fabricante: 'The Pokémon Company',
          anoLancamento: 2025,
          galeria: const [
            'https://http2.mlstatic.com/D_NQ_NP_2X_979006-MLA92143407481_092025-F.webp',
          ],
        ),
      ],
    );
  }
}