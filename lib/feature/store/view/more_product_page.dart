import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/theme/app_colors.dart';
import 'package:huge_basket/core/theme/app_edge_insets.dart';
import 'package:huge_basket/core/widgets/appbar.dart';
import 'package:huge_basket/core/widgets/cart_widget.dart';
import 'package:huge_basket/date/modals/address_model.dart';
import 'package:huge_basket/feature/store/widgets/product_card.dart';

class MoreProductPage extends StatelessWidget {
  const MoreProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<ProductModel>> productMap =
        ModalRoute.settingsOf(context)?.arguments
            as Map<String, List<ProductModel>>;

    final sectionName = productMap.keys.first.toString();

    final List<ProductModel> productList = productMap.values
        .expand((pro) => pro)
        .toList();

    return Scaffold(
      appBar: myAppBar(context, title: sectionName,action: [cartIcon(context)]),
      backgroundColor: AppColors.fadedWhite,
      body: Padding(
        padding: AppEdgeInsets.m,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: buildSliverGridDelegate(),
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return ProductCard(product: productList[index]);
          },
        ),
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount buildSliverGridDelegate() {
    return SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10.r,
          mainAxisSpacing: 10.r,
          crossAxisCount: 2,
          mainAxisExtent: 220,
        );
  }
}
