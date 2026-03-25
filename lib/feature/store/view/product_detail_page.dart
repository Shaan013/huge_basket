import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/theme/app_colors.dart';
import 'package:huge_basket/core/theme/app_edge_insets.dart';
import 'package:huge_basket/core/widgets/appbar.dart';
import 'package:huge_basket/core/widgets/cart_product_quantity_widget.dart';
import 'package:huge_basket/core/widgets/cart_widget.dart';
import 'package:huge_basket/date/modals/address_model.dart';
import 'package:huge_basket/date/provider/provider_carts.dart';
import 'package:huge_basket/date/services/cart_services.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/full_width_elevatid_button.dart';
import '../../../generated/l10n.dart';

List<String> imageUrl = [
  "https://cdn.grofers.com/da/cms-assets/cms/product/69131454-2693-482e-9baa-2ac21d662a1c.png?bg_token=color.background.quaternary",
  "https://cdn.grofers.com/da/cms-assets/cms/product/6f34d139-1e94-4428-820b-3056a2451ff2.png?bg_token=color.background.quaternary",
  "https://cdn.grofers.com/da/cms-assets/cms/product/bda5d292-3ef1-4cb1-b12e-6bdea5160d6f.png",
  "https://cdn.grofers.com/da/cms-assets/cms/product/abe15cde-9086-40b4-b7f5-43558df0d275.png",
];

final String lorem =
    "Where does it come from?Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of ;de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.Where can I get some?There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final _pageViewController = PageController();
  int pageIndex = 0;

  bool isCart = false;

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  void handlePageindex(int value) {
    setState(() {
      pageIndex = value;
    });
  }

  void togateCartButton({
    required ProviderCarts proivder,
    required ProductModel product,
  }) {
    proivder.incrementQuantity(product);
          isCart = false;

  }

  @override
  Widget build(BuildContext context) {
    print("object");
    final cartProvider = context.read<ProviderCarts>();
    final colorscheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final ProductModel product =
        ModalRoute.of(context)?.settings.arguments as ProductModel;
    int productQuantity = CartServices.getQuantityById(
      context,
      productId: product.id,
    );
    isCart = (productQuantity == 0) ? true : false;

    return Scaffold(
      appBar: buildMyAppBar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                imageGallery(),
                imageIndicator(context),
                builtProductShortDetails(
                  product,
                  textTheme,
                  colorscheme,
                  quantity: productQuantity,
                ),
                Divider(thickness: 18.r),
                buildProductDetails(context, textTheme),
              ],
            ),
          ),
          Align(
            alignment: .bottomCenter,
            child: builbottombuttom(
              context,
              product: product,
              provider: cartProvider,
            ),
          ),
        ],
      ),
    );
  }

  Padding builbottombuttom(
    BuildContext context, {
    required ProviderCarts provider,
    required ProductModel product,
  }) {
    return Padding(
      padding: AppEdgeInsets.m,
      child: fullWidthElevatedButton(
        context,
        onTap: isCart
            ? () => togateCartButton(proivder: provider, product: product)
            : null,
        child1: Row(
          spacing: 10.r,
          mainAxisSize: .max,
          mainAxisAlignment: .center,

          children: [
            Icon(Icons.shopping_bag, color: AppColors.white, size: 20.sp),
            Text(
              S.of(context).addToCard,
              style: TextTheme.of(context).labelLarge,
            ),
          ],
        ),
      ),
    );
  }

  Padding buildProductDetails(BuildContext context, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        spacing: 10.r,
        crossAxisAlignment: .start,
        children: [
          Text(S.of(context).productDetails, style: textTheme.titleMedium),
          Text(lorem, softWrap: true, maxLines: 20),
        ],
      ),
    );
  }

  Padding builtProductShortDetails(
    ProductModel product,
    TextTheme textTheme,
    ColorScheme colorsScheme, {
    required int quantity,
  }) {
    return Padding(
      padding: AppEdgeInsets.m,
      child: Column(
        crossAxisAlignment: .start,
        spacing: 10.r,
        children: [
          Text(product.name, style: textTheme.bodyLarge),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Text("\$ ${product.price}", style: textTheme.headlineSmall),
              0.horizontalSpace,
              Visibility(
                visible: !isCart,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: quantityCountContainer(
                  context,
                  quantity: quantity,
                  product: product,
                  direction: .horizontal,
                ),
              ),
              50.horizontalSpace,
              Text(product.weight, style: textTheme.titleMedium),
            ],
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget buildMyAppBar(BuildContext context) {
    return myAppBar(
      context,
      title: S.of(context).productDetails,
      action: [cartIcon(context)],
    );
  }

  AspectRatio imageGallery() {
    return AspectRatio(
      aspectRatio: 1,
      child: PageView(
        onPageChanged: handlePageindex,
        controller: _pageViewController,
        children: imageUrl.map((url) {
          return Image.network(url);
        }).toList(),
      ),
    );
  }

  Row imageIndicator(BuildContext context) {
    return Row(
      spacing: 3,
      mainAxisAlignment: .center,
      children: List.generate(
        imageUrl.length,
        (index) => Container(
          height: 5.r,
          width: 20.r,
          decoration: BoxDecoration(
            color: (pageIndex == index)
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.outline,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
