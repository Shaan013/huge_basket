import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/core/theme/app_out_line_border.dart';
import 'package:huge_basket/date/defData/category_list.dart';
import 'package:huge_basket/date/defData/category_map.dart';
import 'package:huge_basket/date/defData/dairy_eggs_map.dart';
import 'package:huge_basket/feature/store/view_model/category_enum.dart';
import 'package:huge_basket/feature/store/widgets/category_product.dart';
import 'package:huge_basket/feature/store/widgets/choose_category.dart';
import 'package:huge_basket/feature/store/widgets/image_bg_contrainer.dart';
import 'package:huge_basket/feature/store/widgets/transprent_app_bar.dart';

import '../../home_screen/view_model/home_list_model.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  late HomeListModel model =
      ModalRoute.of(context)!.settings.arguments as HomeListModel;
  final ValueNotifier<CategoryEnum> chooseCategoryIndex = ValueNotifier(CategoryEnum.dairyEggs);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            upperSection(context),
            10.verticalSpace,
            ChooseCategory(index: chooseCategoryIndex, list: categoryList, onChange: (CategoryEnum value) {  },),
            10.verticalSpace,
            ...categoryMap[CategoryEnum.dairyEggs]!.entries.map((intem) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ColoredBox(
                  color: Colors.red,
                  child: SizedBox(height: 10, width: 10),
                ),
              );
            }).toList(),
            CategoryProduct(
              productList: dairyEggsMap['Milk'] ?? [],
              sectionName: "Milk",
            ),
          ],
        ),
      ),
    );
  }

  Widget upperSection(BuildContext context) {
    return imageBgContainer(
      imageUrl: model.image,
      child: Column(
        spacing: 10.r,
        children: [
          storeAppBar(context, title: model.title),
          ClipOval(
            child: Image.network(model.image, height: 80.r, width: 80.r),
          ),
          Text(
            model.address,
            style: TextTheme.of(
              context,
            ).bodyMedium!.copyWith(color: Colors.white),
            maxLines: 1,
          ),
          Padding(padding: const EdgeInsets.all(12).r, child: searchField()),
        ],
      ),
    );
  }

  Widget searchField() {
    return TextField(
      decoration: InputDecoration(
        hintStyle: TextTheme.of(
          context,
        ).labelLarge!.copyWith(color: Colors.black.withAlpha(120)),
        hintText: "Search ${model.title}",
        enabledBorder: AppOutLineBorder.authEnable,
        focusedBorder: AppOutLineBorder.authFocus,
        contentPadding: EdgeInsetsGeometry.symmetric(vertical: 12),
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
