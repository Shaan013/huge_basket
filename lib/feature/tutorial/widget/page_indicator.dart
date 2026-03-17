import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class PageIndicator extends StatelessWidget {
  final int length;
  final int selectedIndex;

  const PageIndicator({
    super.key,
    required this.length,
    required this.selectedIndex,
  });

  double get dimention => 8;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: dimention,
        children: List.generate(
          length,
          (index) =>
              indicator(isSelected: (selectedIndex == index), color: color),
        ),
      ),
    );
  }

  Widget indicator({required bool isSelected, required Color color}) {
    return AnimatedContainer(
      height: dimention,
      width: (!isSelected) ? dimention : dimention * 2.5,
      decoration: BoxDecoration(
        color: (isSelected) ? color : AppColors.deepGray,
        borderRadius: BorderRadius.circular(dimention),
        // border: Border.all(color: color),
      ),
      duration: Duration(milliseconds: 300),
    );
  }
}
