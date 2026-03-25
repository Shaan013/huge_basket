import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/routes/app_route.dart';
import 'package:huge_basket/core/theme/app_colors.dart';
import 'package:huge_basket/core/theme/app_edge_insets.dart';
import 'package:huge_basket/date/modals/address_model.dart';
import 'package:huge_basket/feature/store/widgets/product_card.dart';
import 'package:huge_basket/feature/store/widgets/section_container.dart';

import '../../../generated/l10n.dart';

class CategoryProduct extends StatelessWidget {
  final List<ProductModel> productList;
  final String sectionName;


  const CategoryProduct({
    super.key,
    required this.productList,
    required this.sectionName,
  });

  @override
  Widget build(BuildContext context) {
    final image =
        "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=270/da/cms-assets/cms/product/87c1c525-750e-475f-91d1-f155026ddaa1.png";
    final title = "Lactaid Fat Free Pure Milk";

    void goToMoreDetail() {
      Navigator.pushNamed(
        context,
        AppRoute.moreProduct,
        arguments: Map<String, List<ProductModel>>() = {
          sectionName: productList,
        },
      );
    }

    final textTheme = TextTheme.of(context);
    return sectionContainer(
      context,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: .start,
              children: [
                Expanded(
                  child: Text(
                    sectionName,
                    style: textTheme.titleLarge,
                    maxLines: 1,
                  ),
                ),
                Text(S.of(context).more),
                Icon(Icons.arrow_forward_ios, size: 16.r),
              ],
            ),
          ),
          SizedBox(
            height: 230,
            child: SingleChildScrollView(
              scrollDirection: .horizontal,
              child: Row(
                mainAxisAlignment: .start,
                crossAxisAlignment: .center,
                children: [
                  ...productList.map((item) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProductCard(product: item),
                    );
                  }),

                  GestureDetector(
                    onTap: goToMoreDetail,
                    child: Container(
                      margin: AppEdgeInsets.m,
                      padding: AppEdgeInsets.m,
                      decoration: BoxDecoration(
                        shape: .circle,
                        color: AppColors.white,
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }

  // Widget addButton() {
  //   return Container(
  //     height: 40.r,
  //     width: 40.r,
  //     decoration: BoxDecoration(shape: .circle, color: Colors.green.shade100),
  //   );
  // }
}
