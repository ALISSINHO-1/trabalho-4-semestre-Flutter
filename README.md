# Trabalho semestral — Programação para Dispositivos Móveis

## Integrantes

- Alisson Rodrigues Biava Filho — RA 264165-2024
- Guilherme Cortez Lopes — RA 296699-2025
- Luis Felipe Valente Santini — RA 286050-2025

## Domínio

Loja fictícia de consoles retrô, action figures e cards Pokémon.

### Entidade principal

`Item` representa um produto do catálogo, com nome, preço, categoria, descrição,
imagem, fabricante e ano de lançamento.

### Entidade especializada/herança

`ItemEspecial` herda de `Item` e acrescenta material, dimensões e desconto.

### Classe agrupadora/composição

`Grupo` mantém uma coleção encapsulada de `Item` em `_itens`. A relação é de
composição: o catálogo é formado pelos itens que pertencem ao grupo.

## Parte 1 — Dart

Os models da Parte 1 estão em `parte1-dart/bin/models/`. Eles demonstram
entidade, herança, composição e encapsulamento. A Parte 2 preserva os atributos
de produto necessários à interface e mantém `quantidade`, `cadastro`, `ativo` e
`ficha()` para compatibilidade com os conceitos da Parte 1; `quantidade` também
participa do cálculo do total.

## Parte 2 — Flutter

O fluxo avaliado é `HomePage → DetalhePage` e `HomePage → CadastroPage →
HomePage`. A Home inicia com seis produtos e o cadastro adiciona o sétimo sem
reiniciar o aplicativo. Produtos sem imagem local exibem um placeholder offline.

### Evoluções da aplicação

O fluxo principal atual é `SplashPage -> LoginPage -> HomePage`. A Home
preserva `StatefulWidget`, filtros, lista horizontal, cadastro local, detalhe,
carrinho e conta, e também oferece `FavoritosPage` e `CategoriasPage`. O
catálogo mantém os produtos originais e acrescenta seis colecionáveis Iron
Studios em `Grupo.catalogoInicial()`.

## Tabela de rastreio

| # | Exercício | Arquivo e linha real | Evidência |
|---|---|---|---|
| 1 | Entidade principal | `parte1-dart/bin/models/item.dart:1` | Classe `Item` |
| 2 | Herança | `parte1-dart/bin/models/item_especial.dart:3` | `ItemEspecial extends Item` |
| 3 | Composição | `parte1-dart/bin/models/grupo.dart:5, 10` | Grupo contém itens |
| 4 | Encapsulamento | `parte1-dart/bin/models/grupo.dart:5, 12, 18` | `_itens`, getter e total |
| 5 | Estrutura de tela | `parte2-flutter/lib/screens/home_page.dart:41, 44, 123, 124, 125, 248` | Scaffold, AppBar, Column e total |
| 6 | Cartão | `parte2-flutter/lib/screens/widgets/cartao.dart:12, 17, 22` | Container, BoxDecoration, borda e sombra |
| 7 | Lista dinâmica | `parte2-flutter/lib/screens/home_page.dart:298, 299, 300` | `ListView.builder` horizontal alimentado pelo Grupo |
| 8 | Navegação com dados | `parte2-flutter/lib/screens/home_page.dart:307, 308` | MaterialPageRoute recebe `item` |
| 9 | Entrada de dados | `parte2-flutter/lib/screens/cadastro_page.dart:16, 17, 18, 73, 82, 97` | Controllers e três TextFormField |
| 10 | Estado | `parte2-flutter/lib/screens/home_page.dart:11, 386, 387` | StatefulWidget, adicionar e setState |

### Rastreabilidade após as evoluções

| # | Evidência atual | Arquivo e linha real |
|---|---|---|
| 1 | Entidade principal | `parte1-dart/bin/models/item.dart:1` |
| 2 | Herança | `parte1-dart/bin/models/item_especial.dart:3` |
| 3 | Composição | `parte1-dart/bin/models/grupo.dart:3, 5, 12` |
| 4 | Encapsulamento e total | `parte1-dart/bin/models/grupo.dart:5, 12, 18` |
| 5 | Scaffold/AppBar/Column e getter de total | `parte2-flutter/lib/screens/home_page.dart:14, 44, 47, 126, 127, 257` |
| 6 | Container, BoxDecoration, borda e sombra do card | `parte2-flutter/lib/screens/widgets/cartao.dart:26, 28, 31` |
| 7 | ListView.builder principal | `parte2-flutter/lib/screens/home_page.dart:307` |
| 8 | MaterialPageRoute e objeto no detalhe | `parte2-flutter/lib/screens/home_page.dart:321, 322, 323` |
| 9 | Controllers e TextFormField | `parte2-flutter/lib/screens/cadastro_page.dart:16, 17, 18, 73, 82, 97` |
| 10 | StatefulWidget, setState e grupo.adicionar | `parte2-flutter/lib/screens/home_page.dart:14, 346, 416, 417, 418` |

## Fontes dos assets

As imagens dos seis colecionáveis Iron Studios foram obtidas das páginas
oficiais da Iron Studios Brasil e salvas localmente em
`parte2-flutter/assets/images/iron_studios/`, exclusivamente para uso neste
projeto acadêmico fictício. As descrições usadas no catálogo são versões
resumidas e parafraseadas das referências oficiais.

- Spider-Man (10th Anniversary): https://ironstudios.com.br/products/estatua-spider-man-10th-anniversary-marvel-comics-art-scale-110-iron-studios
- Batman Unleashed Deluxe: https://ironstudios.com.br/products/estatua-batman-unleashed-deluxe-dc-comics-art-scale-1-10-iron-studios
- Darth Vader on Throne: https://ironstudios.com.br/products/estatua-darth-vader-on-throne-110-star-wars-art-scale-110-iron-studios
- Sauron Deluxe: https://ironstudios.com.br/products/estatua-sauron-deluxe-the-lord-of-the-rings-art-scale-1-10-iron-studios
- Galadriel: https://ironstudios.com.br/products/estatua-galadriel-o-senhor-dos-aneis-art-scale-1-10-iron-studios
- Blue: https://ironstudios.com.br/products/estatua-blue-jurassic-world-dominion-art-scale-110-iron-studios

## Como executar

```bash
cd parte1-dart
dart run

cd ../parte2-flutter
flutter run
```

## Validação

```bash
cd parte2-flutter
dart format .
flutter analyze
git diff --check
git status
```
