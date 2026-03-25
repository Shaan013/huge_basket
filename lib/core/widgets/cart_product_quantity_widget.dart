import 'package:flutter/material.dart';
import 'package:huge_basket/date/modals/address_model.dart';
import 'package:provider/provider.dart';

import '../../date/provider/provider_carts.dart';
import '../theme/app_box_decoration.dart';

Widget quantityCountContainer(
  BuildContext context, {
  required int quantity,
  required ProductModel product,
  Axis direction = .vertical,
}) {
  final cartProvider = context.read<ProviderCarts>();

  List<Widget> widgetList = [
    GestureDetector(
      onTap: () => cartProvider.incrementQuantity(product),
      child: const Icon(Icons.add, size: 20),
    ),
    const SizedBox(height: 8),
    Text(
      quantity.toString(),
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 8),
    GestureDetector(
      onTap: () => cartProvider.decrementQuantity(product),
      child: Icon(
        quantity <= 1 ? Icons.delete : Icons.remove,
        color: quantity <= 1 ? Colors.red : Colors.black,
        size: 20,
      ),
    ),
  ];

  return Selector<ProviderCarts, int>(
    builder: (_, quanityt, _) {
      return Container(
        // height: (direction== Axis.horizontal)?45:null,
        width: (direction == Axis.vertical) ? 45 : 90,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        decoration: AppBoxDecoration.cartCounterBox(context),
        child: (direction == Axis.vertical)
            ? Column(mainAxisSize: MainAxisSize.min, children: widgetList)
            : Row(
                mainAxisSize: .max,
                mainAxisAlignment: .spaceAround,
                children: widgetList.reversed.toList(),
              ),
      );
    },
    selector: (_, productCart) => productCart.productQuantityBy(product.id),
  );
}
