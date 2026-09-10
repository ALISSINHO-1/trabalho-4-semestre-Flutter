import 'package:flutter/material.dart';

import '../../models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap;

  const ItemCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                child: Image.network(item.imagem,
                    width: double.infinity, fit: BoxFit.cover)),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.categoria,
                        style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: 4),
                    Text(item.nome,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text(item.precoFormatado,
                        style: Theme.of(context).textTheme.titleSmall),
                  ]),
            ),
          ]),
        ),
      );
}
