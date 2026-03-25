import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huge_basket/date/defData/category_list.dart';
import 'package:huge_basket/feature/store/view_model/category_enum.dart';
import 'package:huge_basket/feature/store/view_model/category_model.dart';

import '../../../generated/l10n.dart';

class ChooseCategory extends StatelessWidget {
  final ValueNotifier<CategoryEnum> index;
  final List<CategoryModel> list;
  final ValueChanged<CategoryEnum>? onChange;

  const ChooseCategory({
    super.key,
    required this.index,
    required this.list,
    required this.onChange,
  });

  void handleValue(CategoryEnum cat) {
    index.value = cat;
    onChange?.call(cat);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      color: colorScheme.primaryContainer.withAlpha(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              S.of(context).chooseYourCategory,
              style: textTheme.titleLarge,
              maxLines: 1,
            ),
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: (categoryList.length >= 8) ? 8 : categoryList.length,
              itemBuilder: (context, itemIndex) {
                final item = list[itemIndex];

                return ValueListenableBuilder<CategoryEnum>(
                  valueListenable: index,
                  builder: (context, selectedValue, _) {
                    final bool isSelected = selectedValue.index == itemIndex;

                    return GestureDetector(
                      onTap: () => handleValue(CategoryEnum.values[itemIndex]),
                      child: circlePng(
                        textTheme,
                        imagUrl: item.image,
                        name: item.name,
                        isSelected: isSelected,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget circlePng(
    TextTheme textTheme, {
    bool isSelected = false,
    required String imagUrl,
    required String name,
  }) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Colors.green : Colors.white,
              width: 2,
            ),
          ),
          child: Image.network(imagUrl),
        ),
        Text(
          name,
          style: textTheme.labelMedium!.copyWith(
            color: isSelected ? Colors.green : Colors.black,
            fontWeight: .w700,
          ),
        ),
      ],
    );
  }
}
