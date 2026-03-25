import 'package:flutter/material.dart';
import 'package:huge_basket/core/widgets/smail_icon_with_badge.dart';
import 'package:huge_basket/date/provider/provider_carts.dart';
import 'package:provider/provider.dart';

import '../theme/app_colors.dart';

Widget cartIcon(BuildContext context, {Color iconColor = AppColors.black}) {
  return Selector<ProviderCarts, int>(
    builder: (_, len, _) {
      return smallIconsBadge(
        icons: Icons.shopping_cart,
        count: len,
        iconColor: iconColor,
      );
    },
    selector: (_, product) => product.getLength(),
  );
}
