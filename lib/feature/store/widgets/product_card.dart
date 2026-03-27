import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/routes/app_route.dart';
import 'package:huge_basket/date/modals/address_model.dart';
import 'package:huge_basket/date/provider/provider_carts.dart';
import 'package:huge_basket/date/services/cart_services.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_edge_insets.dart';
import '../../../core/widgets/cart_product_quantity_widget.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  void goToNextPage(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.productDetails, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    final int currentQuantity = CartServices.getQuantityById(
      context,
      productId: product.id,
    );

    final isInCart = currentQuantity != 0;
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => goToNextPage(context),
      child: Container(
        width: 160.w,
        padding: AppEdgeInsets.s,
        decoration: mainContainerdecoration(),
        child: Stack(
          children: [
            buildShowProductDetitle(textTheme),
            Align(
              alignment: .topRight,
              child: buildQuantityCounter(isInCart, context, currentQuantity),
            ),
          ],
        ),
      ),
    );
  }

  Visibility buildQuantityCounter(
    bool isInCart,
    BuildContext context,
    int currentQuantity,
  ) {
    return Visibility(
      visible: !isInCart,
      replacement: quantityCountContainer(
        context,
        quantity: currentQuantity,
        product: product,
      ),
      child: addCountButton(context),
    );
  }

  Column buildShowProductDetitle(TextTheme textTheme) {
    return Column(
      children: [
        Expanded(
          child: Image.network(
            product.imageUrl,
            // height: 100,
            fit: BoxFit.contain,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Text(
                "\$ ${product.price}",
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ), // Fixed
              ),
            ),
            Text(product.weight),
          ],
        ),
        const SizedBox(height: 5),
        Text(
          product.name,
          style: textTheme.bodyLarge,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  BoxDecoration mainContainerdecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
    );
  }

  Widget addCountButton(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ProviderCarts>().incrementQuantity(product),
      child: DottedBorder(
        options: CircularDottedBorderOptions(
          color: Theme.of(context).colorScheme.primary,
          borderPadding: EdgeInsets.all(1.5),
          // padding: EdgeInsets.all(2),
          strokeWidth: 1.5,
          dashPattern: [8, 4],
        ),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(
              context,
            ).colorScheme.primaryContainer.withAlpha(110),
          ),
          child: const Icon(Icons.add, size: 24),
        ),
      ),
    );
  }

  // Widget quantityCountContainer(BuildContext context, int quantity) {
  //   final cartProvider = context.read<ProviderCarts>();
  //
  //   return Container(
  //     width: 45,
  //     padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
  //     decoration: AppBoxDecoration.cartCounterBox(context),
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         GestureDetector(
  //           onTap: () => cartProvider.incrementQuantity(product),
  //           child: const Icon(Icons.add, size: 20),
  //         ),
  //         const SizedBox(height: 8),
  //         Text(
  //           quantity.toString(),
  //           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //         ),
  //         const SizedBox(height: 8),
  //         GestureDetector(
  //           onTap: () => cartProvider.decrementQuantity(product),
  //           child: Icon(
  //             quantity <= 1 ? Icons.delete : Icons.remove,
  //             color: quantity <= 1 ? Colors.red : Colors.black,
  //             size: 20,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
