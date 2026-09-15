Organização e padrão de desenvolvimento do projeto

Para manter o projeto organizado, vamos seguir uma estrutura por módulos. Cada funcionalidade deve ficar dentro da pasta correspondente e devemos evitar criar arquivos soltos ou duplicar componentes que já existem.

A organização principal será:

lib/
├── shared/       # Componentes e recursos reutilizados em vários módulos
├── core/         # Modelos e dados centrais da aplicação
├── auth/         # Login e cadastro
├── home/         # Tela inicial
├── catalog/      # Produtos, categorias e detalhes dos produtos
├── cart/         # Carrinho
├── checkout/     # Finalização da compra
├── favorites/    # Favoritos
└── profile/      # Perfil

Dentro de cada módulo:

pages/: telas completas.
components/: widgets utilizados somente naquele módulo.
models/: estruturas de dados específicas, quando necessário.
mocks/: dados fictícios usados no projeto.
index.dart: exports públicos do módulo.

Componentes utilizados em mais de um módulo devem ficar em:

lib/shared/components/

Cores, temas e estilos globais:

lib/shared/theme/

Constantes gerais:

lib/shared/constants/

Imagens devem ser organizadas em:

assets/images/
├── consoles/
├── action_figures/
├── pokemon_cards/
├── banners/
├── backgrounds/
└── branding/

Padrão de código

Antes de criar algo novo, verificar se já existe um componente semelhante que possa ser reutilizado.

Evitar colocar telas muito grandes em um único arquivo. Quando uma parte começar a crescer ou puder ser reutilizada, transformar em um componente separado.

Usar nomes claros em inglês para arquivos, classes e variáveis:

home_page.dart
product_card.dart
product_detail_page.dart
cart_item.dart

Classes:

ProductCard
ProductDetailPage
CartItem

Variáveis e funções:

productName
selectedProduct
addToCart()

Não criar API, banco de dados ou repository. O projeto será feito somente em Flutter, utilizando dados locais/mockados.

Consoles, Action Figures e Cards Pokémon fazem parte do mesmo catálogo. Portanto, não devemos duplicar toda a estrutura para cada tipo de produto.

Antes de subir uma alteração:

dart format .
flutter analyze

Cada pessoa deve trabalhar somente no escopo da sua tarefa e evitar alterar arquivos de outro módulo sem necessidade. Isso reduz conflitos no Git e mantém o projeto previsível.

A ideia principal é simples: tudo que pertence a uma funcionalidade fica dentro do módulo dela; tudo que é realmente compartilhado fica em shared