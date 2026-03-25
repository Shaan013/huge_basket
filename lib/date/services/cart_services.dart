import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/provider_carts.dart';

class CartServices {
 static  int getQuantityById(BuildContext context, {required int productId}) {
    final cart = context.watch<ProviderCarts>();

    final cartIndexItem = cart.listCarts.indexWhere(
      (item) => item.id == productId,
    );

    final isInCart = cartIndexItem != -1;
    final int currentQuantity = isInCart
        ? cart.listCarts[cartIndexItem].quantity
        : 0;

    return currentQuantity;
  }
}
