import 'package:flutter/material.dart';
import 'package:huge_basket/feature/store/view_model/product_model.dart';

import '../../../core/theme/app_edge_insets.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  // final
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Stack(
      children: [
        Container(
          width: 160,

          padding: AppEdgeInsets.m,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Image.network(product.imageUrl),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "\$ ${product.price}",
                      style: textTheme.bodyMedium!.copyWith(fontWeight: .w600),
                    ),
                  ),
                  Text(product.wight),
                ],
              ),
              Expanded(child: Text(product.name, maxLines: 2)),
            ],
          ),
        ),
        Positioned(top: 8, right: 8, child: addButton(context)),
      ],
    );
  }

  Widget addButton(BuildContext context) {
bool isVisible=false;
    return Visibility(replacement: Container(
      decoration: BoxDecoration(
          shape:.circle,
        color: Theme.of(context).colorScheme.primaryContainer
      ),
    ), child:
    Container(
      width: 45,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Theme.of(context).colorScheme.primary
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.add, size: 26),
          SizedBox(height: 10),
          Text(
            "1",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Icon(Icons.delete, color: Colors.red, size: 26),
        ],
      ),
    ),);
  }
}
